import 'dart:convert';
import 'dart:typed_data';

import 'package:alan/alan.dart';
import 'package:d_email_flutter_client/crypto/aes/aes.dart';
import 'package:d_email_flutter_client/crypto/rsa/rsa.dart';
import 'package:d_email_flutter_client/data/address/model.dart';
import 'package:d_email_flutter_client/data/address/provider.dart';
import 'package:d_email_flutter_client/data/core/base.dart';
import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:d_email_flutter_client/ipfs_client/service/ipfs.dart';
import 'package:d_email_flutter_client/proto/cosmos/email/tx.pb.dart';
import 'package:d_email_flutter_client/util/date.dart';
import 'package:d_email_flutter_client/proto/cosmos/email/query.pbgrpc.dart';
import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:d_email_flutter_client/proto/cosmos/email/email.pb.dart'
    as emailProto;

import 'model.dart';

class DEmailEmailProvider extends BaseDEmailProvider {
  final DEmailAddressProvider addressProvider;
  final Ipfs ipfs;
  QueryClient? queryClient;

  DEmailEmailProvider(
      NetworkInfo demailNetworkInfo, this.addressProvider, this.ipfs)
      : super(demailNetworkInfo) {
    this.queryClient = QueryClient(this.demailNetworkInfo.gRPCChannel);
  }

  Future<void> sendEmail(Email? replyTo, User user, List<String> to,
      String subject, String body) async {
    Wallet wallet = generateWallet(user.mnemonic);

    AESImpl aesImpl = AESImpl.generateKey();

    List<String> trackIDs = [user.trackID.toString()];
    List<String> decryptionKeys = [];

    List<Address> addresses = await this.addressProvider.getAddresses(to);
    addresses.forEach((address) {
      if (!trackIDs.contains(address.trackID.toString())) {
        trackIDs.add(address.trackID.toString());
      }

      RSAImpl rsaImpl = RSAImpl();
      rsaImpl.setKeyPair(address.pubKey, null);
      decryptionKeys.add(encryptAesKeyWithRsa(aesImpl, rsaImpl));
    });

    RSAImpl senderRsaImpl = RSAImpl();
    senderRsaImpl.setKeyPair(user.rsaPublicKey, user.rsaPrivateKey);
    decryptionKeys.add(encryptAesKeyWithRsa(aesImpl, senderRsaImpl));

    String sendedAt = DateUtils.getCurrentISOTimeString();

    String bodyIpfsCid = await saveBodyInIpfs(aesImpl, body);

    final message = MsgCreateEmail.create()
      ..creator = wallet.bech32Address
      ..from = aesImpl.encrypt(user.email)
      ..subject = aesImpl.encrypt(subject)
      ..body = bodyIpfsCid
      ..sendedAt = sendedAt
      ..senderAddressVersion = fixnum.Int64(1)
      ..to = aesImpl.encrypt(to.join(";"))
      ..senderSignature = generateSignature(
          senderRsaImpl, user.email, bodyIpfsCid, sendedAt, to, subject);

    message.decryptionKeys.addAll(decryptionKeys);
    message.trackIds.addAll(trackIDs);

    if (replyTo != null) {
      message.replyTo = replyTo.id;
      message.previousDecryptionKey = encryptAesKeyWithAes(aesImpl,
          AESImpl.fromBase64Key(replyTo.decryptionKey, replyTo.decryptionIV));
    }

    try {
      final response = await sendTransaction(wallet, message, false);
      if (!response.isSuccessful) {
        throw Exception("Cannot send email");
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<Email>> getAllUserEmails(User user) async {
    List<Email> result = [];

    final response = await this.queryClient!.emailAll(QueryAllEmailRequest());
    if (response.email.length > 0) {
      RSAImpl rsaImpl = RSAImpl();
      rsaImpl.setKeyPair(user.rsaPublicKey, user.rsaPrivateKey);

      Map<String, Email> emailCache = {};
      Map<String, emailProto.Email> protoEmailCache = {};

      response.email.forEach((element) {
        protoEmailCache[element.id] = element;
      });

      for (int i = 0; i < response.email.length; i++) {
        try {
          var emailProto = response.email[i];
          var trackIDs = emailProto.trackIds;
          if (trackIDs.contains(user.trackID.toString())) {
            Email? email = await decryptProtoEmail(user.email, rsaImpl,
                emailProto, null, emailCache, protoEmailCache);
            if (email != null) {
              result.add(email);
              emailCache[email.id] = email;
            }
          }
        } catch (e) {
          continue;
        }
      }
    }

    return result;
  }

  Future<Email?> decryptProtoEmail(
      String userEmail,
      RSAImpl rsaImpl,
      emailProto.Email emailProto,
      AESImpl? aesImpl,
      Map<String, Email> emailCache,
      Map<String, emailProto.Email> protoEmailCache) async {
    if (aesImpl == null) {
      aesImpl = getAesDecryptionKey(rsaImpl, emailProto.decryptionKeys);
      if (aesImpl == null) {
        return null;
      }
    }

    String from = aesImpl.decrypt(emailProto.from);
    if (userEmail == from) {
      return null;
    }

    String bodyIpfsCid = emailProto.body;
    String subject = aesImpl.decrypt(emailProto.subject);
    List<String> to = aesImpl.decrypt(emailProto.to).split(";");

    bool validSignature = await validateSignature(emailProto.senderSignature,
        from, bodyIpfsCid, emailProto.sendedAt, to, subject);
    if (!validSignature) {
      return null;
    }

    String body = await loadIpfsBody(aesImpl, bodyIpfsCid);

    var email = Email(
        id: emailProto.id,
        from: from,
        to: to,
        body: body,
        subject: subject,
        sendedAt: DateTime.parse(emailProto.sendedAt),
        decryptionKey: aesImpl.base64Key!,
        decryptionIV: aesImpl.iv!.base16);

    if (emailProto.replyTo.trim() != "") {
      if (emailCache.containsKey(emailProto.replyTo)) {
        email.previous = emailCache[emailProto.replyTo];
      } else {
        AESImpl? previousEmailAesImpl = getAesPreviousDecryptionKey(
            emailProto.previousDecryptionKey, aesImpl);
        if (previousEmailAesImpl != null) {
          Email? previous = await getPreviousEmail(
              userEmail,
              emailProto.replyTo,
              previousEmailAesImpl,
              rsaImpl,
              emailCache,
              protoEmailCache);
          if (previous != null) {
            email.previous = previous;
            emailCache[previous.id] = previous;
          }
        }
      }
    }

    return email;
  }

  Future<Email?> getPreviousEmail(
      String userEmail,
      String id,
      AESImpl aesImpl,
      RSAImpl rsaImpl,
      Map<String, Email> emailCache,
      Map<String, emailProto.Email> protoEmailCache) async {
    emailProto.Email? ep;

    if (protoEmailCache.containsKey(id)) {
      ep = protoEmailCache[id];
    } else {
      var response =
          await this.queryClient!.emailById(QueryGetEmailByIdRequest(id: id));
      ep = response.email;
      protoEmailCache[id] = ep;
    }

    if (ep!.id != "") {
      return await decryptProtoEmail(
          userEmail, rsaImpl, ep, aesImpl, emailCache, protoEmailCache);
    }

    return null;
  }

  AESImpl? getAesDecryptionKey(RSAImpl rsaImpl, List<String> decryptionKeys) {
    for (int i = 0; i < decryptionKeys.length; i++) {
      try {
        String decryptionKey = decryptionKeys[i];
        int idxIvSeparator = decryptionKey.indexOf("-");

        if (idxIvSeparator != -1) {
          List decryptionKeyParts = [
            decryptionKey.substring(0, idxIvSeparator).trim(),
            decryptionKey.substring(idxIvSeparator + 1).trim()
          ];

          Uint8List fromBase64 = base64.decode(decryptionKeyParts[1]);
          String originalValue = utf8.decode(fromBase64);

          String aesKeyValue = rsaImpl.decrypt(originalValue);

          return AESImpl.fromBase64Key(aesKeyValue, decryptionKeyParts[0]);
        }
      } catch (e) {
        continue;
      }
    }

    return null;
  }

  AESImpl? getAesPreviousDecryptionKey(
      String previousDecryptionKey, AESImpl aesImpl) {
    int idxIvSeparator = previousDecryptionKey.indexOf("-");
    if (idxIvSeparator != -1) {
      List decryptionKeyParts = [
        previousDecryptionKey.substring(0, idxIvSeparator).trim(),
        previousDecryptionKey.substring(idxIvSeparator + 1).trim()
      ];

      Uint8List fromBase64 = base64.decode(decryptionKeyParts[1]);
      String originalValue = utf8.decode(fromBase64);

      String aesKeyValue = aesImpl.decrypt(originalValue);
      return AESImpl.fromBase64Key(aesKeyValue, decryptionKeyParts[0]);
    }
  }

  String encryptAesKeyWithRsa(AESImpl key, RSAImpl rsaImpl) {
    String encryptedAesKey = rsaImpl.encrypt(key.base64Key!);
    var bytes = utf8.encode(encryptedAesKey);
    var base64Str = base64.encode(bytes);
    return "${key.iv!.base16}-$base64Str";
  }

  String encryptAesKeyWithAes(AESImpl key, AESImpl aesImpl) {
    String encryptedAesKey = aesImpl.encrypt(key.base64Key!);
    var bytes = utf8.encode(encryptedAesKey);
    var base64Str = base64.encode(bytes);
    return "${key.iv!.base16}-$base64Str";
  }

  String generateSignature(RSAImpl rsaImpl, String from, String bodyIpfsCid,
      String sendedAt, List<String> to, String subject) {
    String dataToSign = "$from-$bodyIpfsCid-$sendedAt-${to.join(';')}-$subject";
    return rsaImpl.sign(dataToSign);
  }

  Future<bool> validateSignature(
      String signature,
      String from,
      String bodyIpfsCid,
      String sendedAt,
      List<String> to,
      String subject) async {
    var senderAddress = await this.addressProvider.getAddress(from);
    String signedData = "$from-$bodyIpfsCid-$sendedAt-${to.join(';')}-$subject";
    RSAImpl rsaImpl = RSAImpl();
    rsaImpl.setKeyPair(senderAddress.pubKey, null);
    return rsaImpl.validateSignature(signature, signedData);
  }

  Future<String> saveBodyInIpfs(AESImpl aesImpl, String body) async {
    var encryptedBody = aesImpl.encrypt(body);
    var ipfsAddBodyResponse = await this.ipfs.add(utf8.encode(encryptedBody));

    if (!ipfsAddBodyResponse.isSuccessful) {
      throw Exception("Cannot save body in ipfs");
    }

    return ipfsAddBodyResponse.body!.hash!;
  }

  Future<String> loadIpfsBody(AESImpl aesImpl, String cid) async {
    var ipfsGetBodyResponse = await this.ipfs.cat(cid);
    if (!ipfsGetBodyResponse.isSuccessful) {
      throw Exception("Cannot retrieve email body from ipfs");
    }

    return aesImpl.decrypt(ipfsGetBodyResponse.body!.body!);
  }
}

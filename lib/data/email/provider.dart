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

  Future<void> sendEmail(
      User user, List<String> to, String subject, String body) async {
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
      decryptionKeys.add(encryptAesKey(aesImpl, rsaImpl));
    });

    RSAImpl senderRsaImpl = RSAImpl();
    senderRsaImpl.setKeyPair(user.rsaPublicKey, user.rsaPrivateKey);
    decryptionKeys.add(encryptAesKey(aesImpl, senderRsaImpl));

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

      for (int i = 0; i < response.email.length; i++) {
        try {
          var trackIDs = response.email[i].trackIds;
          if (trackIDs.contains(user.trackID.toString())) {
            Email? email =
                await decryptProtoEmail(user.email, rsaImpl, response.email[i]);
            if (email != null) {
              result.add(email);
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
      String userEmail, RSAImpl rsaImpl, emailProto.Email email) async {
    AESImpl? aesImpl = getAesDecryptionKey(rsaImpl, email.decryptionKeys);
    if (aesImpl == null) {
      return null;
    }

    String from = aesImpl.decrypt(email.from);
    if (userEmail == from) {
      return null;
    }

    String bodyIpfsCid = email.body;
    String subject = aesImpl.decrypt(email.subject);
    List<String> to = aesImpl.decrypt(email.to).split(";");

    bool validSignature = await validateSignature(
        email.senderSignature, from, bodyIpfsCid, email.sendedAt, to, subject);
    if (!validSignature) {
      print(email.id);
      return null;
    }

    String body = await loadIpfsBody(aesImpl, bodyIpfsCid);

    return Email(
        id: email.id,
        from: from,
        to: to,
        body: body,
        subject: subject,
        sendedAt: DateTime.parse(email.sendedAt));
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

  String encryptAesKey(AESImpl aesImpl, RSAImpl rsaImpl) {
    String encryptedAesKey = rsaImpl.encrypt(aesImpl.base64Key!);
    var bytes = utf8.encode(encryptedAesKey);
    var base64Str = base64.encode(bytes);
    return "${aesImpl.iv!.base16}-$base64Str";
  }

  String generateSignature(RSAImpl rsaImpl, String from, String bodyIpfsCid,
      String sendedAt, List<String> to, String subject) {
    String dataToSign = "$from-$bodyIpfsCid-$sendedAt-${to.join(';')}-$subject";
    print("to sign: ${dataToSign}");
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
    print("Signed: $signedData");
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

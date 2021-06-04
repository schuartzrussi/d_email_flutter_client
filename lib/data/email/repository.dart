import 'dart:typed_data';

import 'package:alan/alan.dart';
import 'package:alan/wallet/export.dart';
import 'dart:convert';
import 'package:grpc/grpc.dart';

import 'package:alan/wallet/network_info.dart';
import 'package:d_email_flutter_client/data/core/repository/repository.dart';
import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:d_email_flutter_client/ipfs_client/dart_ipfs_client.dart';
import 'package:d_email_flutter_client/util/date.dart';
import 'package:encrypt/encrypt.dart' as aesEncrypt;
import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:d_email_flutter_client/proto/cosmos/address/query.pbgrpc.dart'
    as addressQuerier;
import 'package:d_email_flutter_client/proto/cosmos/email/query.pbgrpc.dart'
    as emailQuerier;
import 'package:d_email_flutter_client/proto/cosmos/address/address.pb.dart';
import 'package:d_email_flutter_client/proto/cosmos/email/email.pb.dart'
    as emailProto;
import 'package:d_email_flutter_client/proto/cosmos/email/tx.pb.dart';
import 'package:rsa_encrypt/rsa_encrypt.dart' as rsaEncrypt;
import 'package:pointycastle/export.dart';
import 'package:pointycastle/signers/rsa_signer.dart';

import 'package:d_email_flutter_client/util/crypto.dart';

import 'model.dart';

class EmailRepository extends Repository {
  final NetworkInfo demailNetworkInfo;
  final Ipfs ipfs;
  ClientChannel? channel;
  addressQuerier.QueryClient? addressClient;
  emailQuerier.QueryClient? emailClient;

  EmailRepository(this.demailNetworkInfo, this.ipfs) {
    this.channel = demailNetworkInfo.gRPCChannel;
    this.addressClient = addressQuerier.QueryClient(this.channel!);
    this.emailClient = emailQuerier.QueryClient(this.channel!);
  }

  Future<void> sendEmail(
      User user, List<String> to, String subject, String body) async {
    final aesKeyBase64 = CryptoUtils.createCryptoRandomString(32);
    final iv = aesEncrypt.IV.fromSecureRandom(16);

    var _rsaKeyHelper = rsaEncrypt.RsaKeyHelper();
    final encrypter = aesEncrypt.Encrypter(aesEncrypt.AES(
        aesEncrypt.Key.fromBase64(aesKeyBase64),
        mode: aesEncrypt.AESMode.cbc));

    Wallet wallet =
        Wallet.derive(user.mnemonic.split(' '), this.demailNetworkInfo);

    List<String> trackIDs = [user.trackID.toString()];
    List<String> decryptionKeys = [];

    List<Address> addresses = await getAddresses(to);
    addresses.forEach((address) {
      if (!trackIDs.contains(address.trackID.toString())) {
        trackIDs.add(address.trackID.toString());
      }

      RSAPublicKey publicKey =
          _rsaKeyHelper.parsePublicKeyFromPem(address.pubKey);

      String encryptedAesKey = rsaEncrypt.encrypt(aesKeyBase64, publicKey);
      var bytes = utf8.encode(encryptedAesKey);
      var base64Str = base64.encode(bytes);
      decryptionKeys.add("${iv.base16}-$base64Str");
    });

    String encryptedFrom = encrypter.encrypt(user.email, iv: iv).base64;

    RSAPrivateKey senderPrivateKey =
        _rsaKeyHelper.parsePrivateKeyFromPem(user.rsaPrivateKey);
    RSAPublicKey senderPublicKey =
        _rsaKeyHelper.parsePublicKeyFromPem(user.rsaPublicKey);

    String encryptedAesKey = rsaEncrypt.encrypt(aesKeyBase64, senderPublicKey);
    var bytes = utf8.encode(encryptedAesKey);
    var base64Str = base64.encode(bytes);
    decryptionKeys.add("${iv.base16}-$base64Str");

    var encryptedBody = encrypter.encrypt(body, iv: iv).base64;
    var ipfsAddBodyResponse = await this.ipfs.add(utf8.encode(encryptedBody));

    if (!ipfsAddBodyResponse.isSuccessful) {
      throw Exception("Cannot save body in ipfs");
    }

    var ipfsBodyCid = ipfsAddBodyResponse.body!.hash!;

    String encryptedSubject = encrypter.encrypt(subject, iv: iv).base64;
    String sendedAt = DateUtils.getCurrentISOTimeString();

    String recipientsStr = to.join(";");
    String recipients = encrypter.encrypt(recipientsStr, iv: iv).base64;

    String dataToSign =
        "${user.email}-$ipfsBodyCid-$sendedAt-$recipientsStr-$subject";

    var rsaSigner = RSASigner(SHA256Digest(), "0609608648016503040201");
    var codec = Utf8Codec(allowMalformed: true);
    rsaSigner.init(true, PrivateKeyParameter<RSAPrivateKey>(senderPrivateKey));
    String signature = base64Encode(rsaSigner
        .generateSignature(Uint8List.fromList(codec.encode(dataToSign)))
        .bytes);

    final message = MsgCreateEmail.create()
      ..creator = wallet.bech32Address
      ..from = encryptedFrom
      ..subject = encryptedSubject
      ..body = ipfsBodyCid
      ..sendedAt = sendedAt
      ..senderAddressVersion = fixnum.Int64(1)
      ..to = recipients
      ..senderSignature = signature;

    message.decryptionKeys.addAll(decryptionKeys);
    message.trackIds.addAll(trackIDs);

    final signer = TxSigner.fromNetworkInfo(this.demailNetworkInfo);

    try {
      final tx = await signer.createAndSign(wallet, [message]);
      final txSender = TxSender.fromNetworkInfo(this.demailNetworkInfo);
      final response = await txSender.broadcastTx(tx,
          mode: BroadcastMode.BROADCAST_MODE_SYNC);

      if (!response.isSuccessful) {
        throw Exception("Cannot create transaction");
      }
    } catch (e) {
      throw e;
    }
  }

  // Only for test. Use findByTrackID
  Future<List<Email>> findAllUserEmails(User user) async {
    List<Email> result = [];

    final response =
        await this.emailClient!.emailAll(emailQuerier.QueryAllEmailRequest());

    var _rsaKeyHelper = rsaEncrypt.RsaKeyHelper();
    RSAPrivateKey userPrivateKey =
        _rsaKeyHelper.parsePrivateKeyFromPem(user.rsaPrivateKey);
    RSAPublicKey userPublicKey =
        _rsaKeyHelper.parsePublicKeyFromPem(user.rsaPublicKey);

    if (response.email.length > 0) {
      for (int i = 0; i < response.email.length; i++) {
        var trackIDs = response.email[i].trackIds;
        if (trackIDs.contains(user.trackID.toString())) {
          Email? email = await decryptProtoEmail(user.email, _rsaKeyHelper,
              userPrivateKey, userPublicKey, response.email[i]);
          if (email != null) {
            result.add(email);
          }
        }
      }
    }

    return result;
  }

  Future<Email?> decryptProtoEmail(
      String userEmail,
      rsaEncrypt.RsaKeyHelper rsaKeyHelper,
      RSAPrivateKey userPrivateKey,
      RSAPublicKey userPublicKey,
      emailProto.Email email) async {
    for (int i = 0; i < email.decryptionKeys.length; i++) {
      try {
        String decryptionKey = email.decryptionKeys[i];
        int idxIvSeparator = decryptionKey.indexOf("-");

        if (idxIvSeparator != -1) {
          List decryptionKeyParts = [
            decryptionKey.substring(0, idxIvSeparator).trim(),
            decryptionKey.substring(idxIvSeparator + 1).trim()
          ];

          final iv = aesEncrypt.IV.fromBase16(decryptionKeyParts[0]);
          Uint8List fromBase64 = base64.decode(decryptionKeyParts[1]);
          String originalValue = utf8.decode(fromBase64);

          String aesKeyValue =
              rsaEncrypt.decrypt(originalValue, userPrivateKey);
          final key = aesEncrypt.Key.fromBase64(aesKeyValue);

          final decrypter = aesEncrypt.Encrypter(
              aesEncrypt.AES(key, mode: aesEncrypt.AESMode.cbc));

          String from = decrypter.decrypt64(email.from, iv: iv);

          if (userEmail == from) {
            continue;
          }

          String bodyIpfsCid = email.body;
          String subject = decrypter.decrypt64(email.subject, iv: iv);
          String to = decrypter.decrypt64(email.to, iv: iv);

          var fromAddress = await getAddresse(from);
          RSAPublicKey fromPublicKey =
              rsaKeyHelper.parsePublicKeyFromPem(fromAddress.pubKey);

          String signedData =
              "$from-$bodyIpfsCid-${email.sendedAt}-$to-$subject";

          var rsaSigner = RSASigner(SHA256Digest(), "0609608648016503040201");
          rsaSigner.init(
              false, PublicKeyParameter<RSAPublicKey>(fromPublicKey));
          var codec = Utf8Codec(allowMalformed: true);
          var rsaSignature = RSASignature(base64Decode(email.senderSignature));
          var expectedSignatureData =
              Uint8List.fromList(codec.encode(signedData));

          if (!rsaSigner.verifySignature(expectedSignatureData, rsaSignature)) {
            throw Exception("Invalid signature");
          }

          var ipfsGetBodyResponse = await this.ipfs.cat(bodyIpfsCid);
          var ipfsBodyContent =
              decrypter.decrypt64(ipfsGetBodyResponse.body!.body!, iv: iv);

          if (!ipfsGetBodyResponse.isSuccessful) {
            throw Exception("Cannot retrieve email body from ipfs");
          }

          return Email(
              id: email.id,
              from: from,
              to: to.split(";"),
              body: ipfsBodyContent,
              subject: subject,
              sendedAt: DateTime.parse(email.sendedAt));
        }
      } catch (_) {
        continue;
      }
    }

    return null;
  }

  Future<List<Address>> getAddresses(List<String> names) async {
    List<Address> result = [];

    for (int i = 0; i < names.length; i++) {
      final address = await getAddresse(names[i]);
      result.add(address);
    }

    return result;
  }

  Future<Address> getAddresse(String name) async {
    final response = await this
        .addressClient!
        .addressByName(addressQuerier.QueryGetAddressByNameRequest(name: name));

    return response.address;
  }

  @override
  void dispose() {}
}

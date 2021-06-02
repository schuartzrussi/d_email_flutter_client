import 'dart:typed_data';

import 'package:alan/alan.dart';
import 'package:alan/wallet/export.dart';
import 'dart:convert';

import 'package:alan/wallet/network_info.dart';
import 'package:d_email_flutter_client/data/core/repository/repository.dart';
import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:d_email_flutter_client/util/date.dart';
import 'package:encrypt/encrypt.dart';
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

import 'package:d_email_flutter_client/util/crypto.dart';

import 'model.dart';

class EmailRepository extends Repository {
  final NetworkInfo demailNetworkInfo;

  EmailRepository(this.demailNetworkInfo);

  Future<void> sendEmail(
      User user, List<String> to, String subject, String body) async {
    final keyBase64 = CryptoUtils.createCryptoRandomString(32);
    final key = Key.fromBase64(keyBase64);
    final iv = IV.fromLength(16);
    final String aesKeyValue = '${iv.base64}-$keyBase64';

    var _rsaKeyHelper = rsaEncrypt.RsaKeyHelper();
    final encrypter = Encrypter(AES(key));

    Wallet wallet =
        Wallet.derive(user.mnemonic.split(' '), this.demailNetworkInfo);

    List<String> trackIDs = [];
    List<String> decryptionKeys = [];

    List<Address> addresses = await getAddresses(to);
    addresses.forEach((address) {
      if (!trackIDs.contains(address.trackID.toString())) {
        trackIDs.add(address.trackID.toString());
      }

      RSAPublicKey publicKey =
          _rsaKeyHelper.parsePublicKeyFromPem(address.pubKey);

      String encryptedRsaKey = rsaEncrypt.encrypt(aesKeyValue, publicKey);
      var bytes = utf8.encode(encryptedRsaKey);
      var base64Str = base64.encode(bytes);
      decryptionKeys.add(base64Str);
    });

    String encryptedFrom = encrypter.encrypt(user.email, iv: iv).base64;

    RSAPrivateKey senderPrivateKey =
        _rsaKeyHelper.parsePrivateKeyFromPem(user.rsaPrivateKey);
    RSAPublicKey senderPublicKey =
        _rsaKeyHelper.parsePublicKeyFromPem(user.rsaPublicKey);
    String signature = _rsaKeyHelper.sign(encryptedFrom, senderPrivateKey);

    String encryptedRsaKey = rsaEncrypt.encrypt(aesKeyValue, senderPublicKey);
    var bytes = utf8.encode(encryptedRsaKey);
    var base64Str = base64.encode(bytes);
    decryptionKeys.add(base64Str);

    final message = MsgCreateEmail.create()
      ..creator = wallet.bech32Address
      ..from = encryptedFrom
      ..subject = encrypter.encrypt(subject, iv: iv).base64
      ..body = encrypter.encrypt(body, iv: iv).base64 // TODO save in IPFS
      ..sendedAt = DateUtils.getCurrentISOTimeString()
      ..senderAddressVersion = fixnum.Int64(1)
      ..to = encrypter.encrypt(to.join(";"), iv: iv).base64
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
        print(response.toString());
        throw Exception("Cannot create transaction");
      }
    } catch (e) {
      throw e;
    }
  }

  // Only for test. Use findByTrackID
  Future<List<Email>> findAllUserEmails(User user) async {
    List<Email> result = [];

    final channel = this.demailNetworkInfo.gRPCChannel;

    final emailClient = emailQuerier.QueryClient(channel);
    final response =
        await emailClient.emailAll(emailQuerier.QueryAllEmailRequest());

    var _rsaKeyHelper = rsaEncrypt.RsaKeyHelper();
    RSAPrivateKey userPrivateKey =
        _rsaKeyHelper.parsePrivateKeyFromPem(user.rsaPrivateKey);
    RSAPublicKey userPublicKey =
        _rsaKeyHelper.parsePublicKeyFromPem(user.rsaPublicKey);

    if (response.email.length > 0) {
      for (int i = 0; i < response.email.length; i++) {
        var trackIDs = response.email[i].trackIds;
        if (trackIDs.contains(user.trackID.toString())) {
          Email? email = await decryptProtoEmail(
              userPrivateKey, userPublicKey, response.email[i]);
          if (email != null) {
            result.add(email);
          }
        }
      }
    }

    return result;
  }

  Future<Email?> decryptProtoEmail(RSAPrivateKey userPrivateKey,
      RSAPublicKey userPublicKey, emailProto.Email email) async {
    for (int i = 0; i < email.decryptionKeys.length; i++) {
      try {
        Uint8List fromBase64 = base64.decode(email.decryptionKeys[i]);
        String originalValue = utf8.decode(fromBase64);
        String aesKeyValue = rsaEncrypt.decrypt(originalValue, userPrivateKey);
        List<String> splitedKey = aesKeyValue.split("-");
        if (splitedKey.length == 2) {
          final iv = IV.fromBase64(splitedKey[0]);
          final key = Key.fromBase64(splitedKey[1]);

          final decrypter = Encrypter(AES(key));

          String from = decrypter.decrypt64(email.from, iv: iv);
          // TODO check from signature
          String body = decrypter.decrypt64(email.body, iv: iv);
          String subject = decrypter.decrypt64(email.subject, iv: iv);
          String to = decrypter.decrypt64(email.to, iv: iv);

          return Email(
              id: email.id,
              from: from,
              to: to.split(";"),
              body: body,
              subject: subject,
              sendedAt: DateTime.parse(email.sendedAt));
        }
      } catch (e) {
        continue;
      }
    }

    return null;
  }

  Future<List<Address>> getAddresses(List<String> names) async {
    final channel = this.demailNetworkInfo.gRPCChannel;

    final addressClient = addressQuerier.QueryClient(channel);

    List<Address> result = [];

    for (int i = 0; i < names.length; i++) {
      final response = await addressClient.addressByName(
          addressQuerier.QueryGetAddressByNameRequest(name: names[i]));
      result.add(response.address);
    }

    return result;
  }

  @override
  void dispose() {}
}

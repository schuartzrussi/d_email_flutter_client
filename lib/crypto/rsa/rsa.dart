import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:rsa_encrypt/rsa_encrypt.dart';
import 'package:pointycastle/export.dart';
import 'package:rsa_encrypt/rsa_encrypt.dart' as rsaEncrypt;

import 'key_pair.dart';

class RSAImpl {
  RSAKeyPair? keyPair;

  var rsaKeyHelper = RsaKeyHelper();
  var rsaSigner = RSASigner(SHA256Digest(), "0609608648016503040201");
  var codec = Utf8Codec(allowMalformed: true);

  Future<RSAKeyPair> setNewKeyPair() async {
    final _keyPair =
        await rsaKeyHelper.computeRSAKeyPair(rsaKeyHelper.getSecureRandom());

    String encodedPublicKey = rsaKeyHelper
        .encodePublicKeyToPemPKCS1(_keyPair.publicKey as RSAPublicKey);

    String encodedPrivateKey = rsaKeyHelper
        .encodePrivateKeyToPemPKCS1(_keyPair.privateKey as RSAPrivateKey);

    this.keyPair = RSAKeyPair(encodedPublicKey, encodedPrivateKey);
    return this.keyPair!;
  }

  Future<void>? setKeyPair(String? publicKey, String? privateKey) {
    this.keyPair = RSAKeyPair(publicKey, privateKey);
  }

  String encrypt(String value) {
    return rsaEncrypt.encrypt(value, this.keyPair!.rsaPublicKey!);
  }

  String decrypt(String value) {
    return rsaEncrypt.decrypt(value, this.keyPair!.rsaPrivateKey!);
  }

  String sign(String data) {
    rsaSigner.init(
        true, PrivateKeyParameter<RSAPrivateKey>(this.keyPair!.rsaPrivateKey!));

    return base64Encode(rsaSigner
        .generateSignature(Uint8List.fromList(codec.encode(data)))
        .bytes);
  }

  bool validateSignature(String signature, String signedData) {
    rsaSigner.init(
        false, PublicKeyParameter<RSAPublicKey>(this.keyPair!.rsaPublicKey!));
    var codec = Utf8Codec(allowMalformed: true);
    var rsaSignature = RSASignature(base64Decode(signature));
    var expectedSignatureData = Uint8List.fromList(codec.encode(signedData));

    return rsaSigner.verifySignature(expectedSignatureData, rsaSignature);
  }
}

import 'package:pointycastle/export.dart';
import 'package:rsa_encrypt/rsa_encrypt.dart';

class RSAKeyPair {
  var rsaKeyHelper = RsaKeyHelper();

  final String? pemPublicKey;
  final String? pemPrivateKey;

  RSAPublicKey? rsaPublicKey;
  RSAPrivateKey? rsaPrivateKey;

  RSAKeyPair(this.pemPublicKey, this.pemPrivateKey) {
    if (this.pemPublicKey != null) {
      this.rsaPublicKey = rsaKeyHelper.parsePublicKeyFromPem(this.pemPublicKey);
    }

    if (this.pemPrivateKey != null) {
      this.rsaPrivateKey =
          rsaKeyHelper.parsePrivateKeyFromPem(this.pemPrivateKey);
    }
  }
}

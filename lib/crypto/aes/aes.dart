import 'package:encrypt/encrypt.dart' as aesEncrypt;
import 'dart:convert';
import 'dart:math';

class AESImpl {
  static final Random _random = Random.secure();

  aesEncrypt.IV? iv;
  String? base64Key;
  aesEncrypt.Encrypter? encrypter;

  AESImpl.generateKey() {
    this.base64Key = createCryptoRandomString(32);
    this.iv = aesEncrypt.IV.fromSecureRandom(16);
    this.encrypter = aesEncrypt.Encrypter(aesEncrypt.AES(
        aesEncrypt.Key.fromBase64(this.base64Key!),
        mode: aesEncrypt.AESMode.cbc));
  }

  AESImpl.fromBase64Key(String base64Key, String iv) {
    this.base64Key = base64Key;
    this.iv = aesEncrypt.IV.fromBase16(iv);
    this.encrypter = aesEncrypt.Encrypter(aesEncrypt.AES(
        aesEncrypt.Key.fromBase64(this.base64Key!),
        mode: aesEncrypt.AESMode.cbc));
  }

  String createCryptoRandomString([int length = 32]) {
    var values = List<int>.generate(length, (i) => _random.nextInt(256));

    return base64Url.encode(values);
  }

  String encrypt(String value) {
    return this.encrypter!.encrypt(value, iv: iv).base64;
  }

  String decrypt(String value) {
    return this.encrypter!.decrypt64(value, iv: iv);
  }
}

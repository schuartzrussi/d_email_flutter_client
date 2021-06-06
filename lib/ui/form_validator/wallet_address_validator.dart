import 'package:alan/wallet/bech32_encoder.dart';

class WalletAddressFormValidator {
  static String? validate(String? address) {
    if (address == null || address == '') {
      return 'Esse campo é obrigatório';
    }

    try {
      Bech32Encoder.decode(address);
    } catch (_) {
      return 'Endereco invalido';
    }
    return null;
  }
}

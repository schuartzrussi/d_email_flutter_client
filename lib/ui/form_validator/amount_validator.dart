class AmountFormValidator {
  static String? validateAmountField(String? value, String fieldName, int max) {
    if (value == null || value == '') {
      return '$fieldName é obrigatório';
    }

    try {
      int amount = int.parse(value);

      if (amount > max) {
        return 'Valor indisponivel';
      }
    } catch (_) {
      return '$fieldName precisa ser um valor numerico inteiro';
    }
    return null;
  }
}

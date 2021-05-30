class RequiredFieldFormValidator {
  static String? validateRequiredField(String? value, fieldName) {
    if (value == null || value == '') {
      return '$fieldName é obrigatório';
    }
    return null;
  }
}

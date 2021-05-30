class EmailFormValidator {
  static String? validateEmail(String? email) {
    if (email == null || email == '') {
      return 'Email é obrigatório';
    }

    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (!regex.hasMatch(email)) {
      return 'Email inválido';
    }
    return null;
  }
}

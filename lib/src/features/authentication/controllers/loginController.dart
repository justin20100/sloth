import 'package:email_validator/email_validator.dart';

class EmailInputController {
  late String? error;

  bool validate(context, email) {
    if (email.isNotEmpty) {
      if (EmailValidator.validate(email)) {
        error = null;
        return true;
      } else {
        error = "L'email n'est pas valide";
        return false;
      }
    } else {
      error = "Il manque un email";
      return false;
    }
  }
}

class PasswordInputController {
  late String? error;
  bool validate(context, password) {
    if (password.isNotEmpty) {
      if (RegExp(r'^(?=.*?[A-Z]).{8,}$').hasMatch(password)) {
        error = null;
        return true;
      } else {
        error = "Il faut 1 majuscule et 9 caractères";
        return false;
      }
    } else {
      error = "Il manque un mot de passe";
      return false;
    }
  }
}

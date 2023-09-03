import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailInputController {
  late String? error = null;
  Future<bool> validate(context, email) async {
    if (email.isNotEmpty) {
      if (EmailValidator.validate(email)) {
        var fbEmail = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
        if( fbEmail.isEmpty){
          error = null;
          return true;
        }else{
          error = "Cet email est déja utilisé";
          return false;
        }
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
  late String? error = null;
  bool validate(context, password) {
    if (password.isNotEmpty) {
      if (RegExp(r'^(?=.*?[A-Z]).{8,}$').hasMatch(password)) {
        error = null;
        return true;
      } else {
        error = "Il faut minimum 1 majuscule et 9 caractères";
        return false;
      }
    } else {
      error = "Il manque un mot de passe";
      return false;
    }
  }
}
class ValidatedPasswordInputController {
  late String? error = null;
  bool validate(context, password, validatedPassword) {
    if (password.isNotEmpty) {
      if (RegExp(r'^(?=.*?[A-Z]).{8,}$').hasMatch(password)) {
        if(password == validatedPassword){
          error = null;
          return true;
        }else{
          error = "Il faut que les deux mots de passe soient identiques";
          return false;
        }
      } else {
        error = "Il faut minimum 1 majuscule et 9 caractères";
        return false;
      }
    } else {
      error = "Il manque un mot de passe";
      return false;
    }
  }
}
class DataUsageCheckController {
  late String? error = null;
  bool validate(context, dataUsageAccepted) {
    if (dataUsageAccepted == true) {
        error = null;
        return true;
    } else {
      error = "Cette case doit ètre cochée avant de continuer";
      return false;
    }
  }
}
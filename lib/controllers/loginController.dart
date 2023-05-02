import 'package:sloth/models/loginModel.dart';
import 'package:sloth/validator/validator.dart';

class LoginController{
  LoginModel loginModel;

  LoginController({required this.loginModel});

  void Checkemail(email) {
    if(Validator.check){
      if (value == null || value.isEmpty) {
        return 'Vous avez oublié de remplir votre email';
      } else if (!EmailValidator.validate(value)) {
        return "L'adresse mail doit être valide";
      }
    }
  }
}
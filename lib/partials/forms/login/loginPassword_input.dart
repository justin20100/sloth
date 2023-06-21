import 'package:flutter/material.dart';
import 'package:sloth/controllers/loginController.dart';
import 'package:sloth/partials/forms/text_input.dart';
@immutable
class LoginPasswordInput extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  LoginPasswordInput({this.onChanged,required String email,required String password, Key? key}) : super(key: key);

  @override
  State<LoginPasswordInput> createState() => _LoginPasswordInputState();
}

class _LoginPasswordInputState extends State<LoginPasswordInput> {
  final LoginController _loginController = LoginController();
  late String email = email;
  late String password = password;

  @override
  Widget build(BuildContext context) {
      return TextInput(
        hintText: "Votre mot de passe",
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Ce champ ne peut pas être vide';
          } /*else if(_loginController.checkPassword(email, password)){
            return "Votre mot de passe n'est pas bon";
          }*/
        },
        obscureText: true,
        onChanged: widget.onChanged,
      );
  }
}

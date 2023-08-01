import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/text_input.dart';

@immutable
class ValidatedPasswordInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String password;

  const ValidatedPasswordInput({required this.password,this.onChanged, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return TextInput(
        hintText: "Votre mot de passe",
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if(value == null || value.isEmpty){
            return 'Ce champ ne peut pas être vide';
          }
          if (value != password) {
            return 'Vérifiez vos mots de passe';
          }
        },
        obscureText: true,
        onChanged: onChanged,
      );
  }
}

import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/text_input.dart';

import '../../styles/constants.dart';

@immutable
class ValidatedPasswordInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String password;

  const ValidatedPasswordInput({required this.password,this.onChanged, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return TextInput(
        hintText: "Mot2passe",
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if(value == null || value.isEmpty){
            return 'Vous avez oublié de confirmer votre mot de passe';
          }
          if (value != password) {
            return 'Recopier correctement votre mot de passe';
          }
        },
        obscureText: true,
        onChanged: onChanged,
      );
  }
}

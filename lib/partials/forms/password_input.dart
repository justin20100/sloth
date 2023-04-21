import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/text_input.dart';

import '../../styles/constants.dart';

@immutable
class PasswordInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const PasswordInput({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoration,
      child: TextInput(
        hintText: "Mot2passe",
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vous avez oublié de remplir votre mot de passe.';
          } else if (value.length <= 10) {
            return 'Le mot de passe doit contenir au moins 10 caractères, 1 chiffre et 1 majuscule.';
          }
        },
        obscureText: true,
        onChanged: onChanged,
      ),
    );
  }
}

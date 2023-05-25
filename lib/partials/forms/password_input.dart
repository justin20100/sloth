import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/text_input.dart';

import '../../styles/constants.dart';

@immutable
class PasswordInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const PasswordInput({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return TextInput(
        hintText: "Motdepasse",
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Ce champ ne peut pas être vide';
          } else if (value.length <= 10) {
            return 'On demande 10 caractères';
          }
        },
        obscureText: true,
        onChanged: onChanged,
      );
  }
}

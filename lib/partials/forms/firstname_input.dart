import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/text_input.dart';

@immutable
class FirstNameInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const FirstNameInput({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInput(
      hintText: 'Julien',
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Le prénom doit etre doit être renseigné.';
        } else if (value.length < 2) {
          return 'Le prénom doit contenir au moins 2 caractères.';
        }
      },
      onChanged: onChanged,
    );
  }
}

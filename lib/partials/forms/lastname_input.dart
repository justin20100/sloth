import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/text_input.dart';

@immutable
class LastNameInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const LastNameInput({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInput(
      hintText: 'unique.name',
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Le nom doit etre doit être renseigné.';
        } else if (value.length < 2) {
          return 'Le nom doit contenir au moins 2 caractères.';
        }
      },
      onChanged: onChanged,
    );
  }
}

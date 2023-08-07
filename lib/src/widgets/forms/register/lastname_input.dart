import 'package:flutter/material.dart';
import 'package:sloth/src/widgets/forms/text_input.dart';

@immutable
class LastNameInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const LastNameInput({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInput(
      hintText: 'Dubois',
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ce champ ne peut pas être vide';
        } else if (value.length < 2) {
          return 'Ce champ doit contenir au moins 2 caractères.';
        }
      },
      onChanged: onChanged,
    );
  }
}

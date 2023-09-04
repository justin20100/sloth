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
      validator: (value) {return null;
      },
      onChanged: onChanged,
    );
  }
}

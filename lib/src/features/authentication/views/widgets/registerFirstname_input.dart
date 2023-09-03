import 'package:flutter/material.dart';
import 'package:sloth/src/widgets/forms/text_input.dart';

@immutable
class FirstNameInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const FirstNameInput({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInput(
      hintText: 'Julien',
      keyboardType: TextInputType.text,
      validator: (value) {return null;},
      onChanged: onChanged,
    );
  }
}

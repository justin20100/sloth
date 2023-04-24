import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/text_input.dart';

@immutable
class PhoneInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const PhoneInput({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInput(
      hintText: '0000000000',
      keyboardType: TextInputType.phone,
      validator: (value) {return "";},
      onChanged: onChanged,
    );
  }
}

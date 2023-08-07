import 'package:flutter/material.dart';
import 'package:sloth/src/widgets/forms/text_input.dart';

@immutable
class PhoneInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const PhoneInput({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInput(
      hintText: '0440253645',
      keyboardType: TextInputType.phone,
      validator: (value) {
        return null;
      },
      onChanged: onChanged,
    );
  }
}

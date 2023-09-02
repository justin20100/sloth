import 'package:flutter/material.dart';
import 'package:sloth/src/widgets/forms/text_input.dart';

@immutable
class EmailInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const EmailInput({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInput(
      autofocus: false,
      hintText: 'exemple@mail.com',
      keyboardType: TextInputType.emailAddress,
      validator: (value) {return '';},
      onChanged: onChanged,
    );
  }
}

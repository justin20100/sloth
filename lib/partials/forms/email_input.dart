import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/text_input.dart';

@immutable
class EmailInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const EmailInput({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInput(
      autofocus: true,
      hintText: 'exemple@mail.com',
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ce champ ne peut pas être vide';
        } else if (!EmailValidator.validate(value)) {
          return "Ceci n'est pas une email valide";
        }
      },
      onChanged: onChanged,
    );
  }
}

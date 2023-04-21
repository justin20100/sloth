import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/text_input.dart';
import 'package:sloth/styles/constants.dart';

@immutable
class EmailInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const EmailInput({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoration,
      child: TextInput(
        hintText: 'exemple@mail.com',
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vous avez oublié de remplir votre email';
          } else if (!EmailValidator.validate(value)) {
            return "L'adresse mail doit ètre valide";
          }
        },
        onChanged: onChanged,
      ),
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/src/widgets/forms/text_input.dart';

@immutable
class ResetPEmailInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const ResetPEmailInput({this.onChanged, Key? key}) : super(key: key);

  Future<bool> checkIfEmailInUse(String emailAddress) async {
    final list =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);
    if (list.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextInput(
      hintText: 'exemple@mail.com',
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ce champ ne peut pas être vide';
        } else if (!EmailValidator.validate(value)) {
          return "Ceci n'est pas un email valide";
        }
      },
      onChanged: onChanged,
    );
  }
}

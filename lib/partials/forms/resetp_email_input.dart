import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/text_input.dart';

@immutable
class ResetPEmailInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const ResetPEmailInput({this.onChanged, Key? key}) : super(key: key);

  Future<bool> checkIfEmailInUse(String emailAddress) async {
    final list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);
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
      validator: (value)  {
/*
        final emailList = FirebaseAuth.instance.fetchSignInMethodsForEmail(value!);
*/
        if (value == null || value.isEmpty) {
          return 'Vous avez oublié de remplir votre email';
        } else if (!EmailValidator.validate(value)) {
          return "L'adresse mail doit être valide";
        }
        /*else if (await checkIfEmailInUse(value)){
        return "Cette email n'est pas associée a un compte Sloth.";
        }*/
      },
      onChanged: onChanged,
    );
  }
}

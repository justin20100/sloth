import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/error_firebase_auth.dart';
import '../../partials/forms/email_input.dart';
import '../../partials/forms/password_input.dart';
import '../../routes/routes.dart';
import '../../styles/constants.dart';
import '../../tools/button.dart';

class ResetPasswordForm extends StatelessWidget {
  ResetPasswordForm({Key? key}) : super(key: key);
  final _resetPasswordFormKey = GlobalKey<FormState>();
  String _email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorCream,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(
                  left: kNormalHorizontalSpacer * 2,
                  right: kNormalHorizontalSpacer * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  // Logo et texte
                  Column(
                    children: const [
                      Image(
                        image: AssetImage('assets/img/logo.png'),
                      ),
                      Text('Un mail de reinitialisation du mot de passe vous sera envoyer.',
                          style: kBigGreenText, textAlign: TextAlign.center),
                    ],
                  ),

                  // Formulaire de connection
                  Form(
                    key: _resetPasswordFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // Email
                        const Text(
                          "Votre email",
                          style: kLabelGreenText,
                        ),
                        const SizedBox(
                          height: kSmallHorizontalSpacer,
                        ),
                        EmailInput(
                          onChanged: (value) {
                            _email = value;
                          },
                        ),
                        const SizedBox(
                          height: kNormalHorizontalSpacer,
                        ),

                        // Bouton
                        Center(
                          child: Button(
                              label: "Recevoir un mail",
                              onPressed: () async {}),
                        ),
                        const SizedBox(
                          height: kMicroVerticalSpacer,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, kRegisterRoute);
                          },
                          child: const Text(
                            'Créer un compte',
                            style: kSmallLinkGreenText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}

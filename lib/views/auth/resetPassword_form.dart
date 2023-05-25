import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/resetp_email_input.dart';
import '../../models/error_firebase_auth.dart';
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
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
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
                        Text(
                            'Recevoir un mail de réinitialisation du mot de passe.',
                            style: kBigGreenText,
                            textAlign: TextAlign.center),
                      ],
                    ),

                    // Formulaire de reinitialisation du mot de passe
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
                          ResetPEmailInput(
                            onChanged: (value) {
                              _email = value;
                            },
                          ),
                          const SizedBox(
                            height: kBigVerticalSpacer * 2,
                          ),

                          // Bouton
                          Center(
                            child: Button(
                                label: "Recevoir un mail",
                                onPressed: () async {
                                  if (_resetPasswordFormKey.currentState !=
                                          null &&
                                      _resetPasswordFormKey.currentState!
                                          .validate()) {
                                    try {
                                      await FirebaseAuth.instance
                                          .sendPasswordResetEmail(email: _email)
                                          .then((value) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  "L'email de reinitialisation du mot de passe a été envoyé")),
                                        );
                                        Navigator.pushNamed(
                                            context, kLoginRoute);
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                              errors[e.code]!,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            backgroundColor: Colors.redAccent),
                                      );
                                    }
                                  }
                                }),
                          ),
                          const SizedBox(
                            height: kMicroVerticalSpacer,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, kLoginRoute);
                            },
                            child: const Text(
                              'Se connecter',
                              style: kSmallLinkGreenText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}

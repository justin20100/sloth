import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/resetp_email_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                    left: kNormalHorizontalSpacer,
                    right: kNormalHorizontalSpacer),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Logo et texte
                    Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/img/logo.png'),
                        ),
                        Text(
                            AppLocalizations.of(context)!.resetPassword__introText,
                            style: kBigLabelTextStyle,
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
                          Text(
                            AppLocalizations.of(context)!.resetPassword__emailLabel,
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
                        ],
                      ),
                    ),
                    // Bouton
                    Column(
                      children: [
                        Center(
                          child: Button(
                              label: AppLocalizations.of(context)!.resetPassword__button,
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
                                            content: Text("L'email de reinitialisation du mot de passe a été envoyé")),
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
                          height: kMicroVerticalSpacer*2,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, kLoginRoute);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.resetPassword__backButton,
                            style: kSmallLinkGreenText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}

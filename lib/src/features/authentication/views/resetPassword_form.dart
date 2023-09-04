import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/src/features/authentication/models/error_firebase_auth.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:sloth/src/features/authentication/views/widgets/resetPasswordEmail_input.dart';
import 'package:sloth/src/widgets/snackbars/error_snackbar.dart';
import 'package:sloth/src/widgets/snackbars/success_snackbar.dart';

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
                                          SuccessSnackbar.show(context, AppLocalizations.of(context)!.snackBar__resetPasswordSuccess);
                                      Navigator.pushNamed(
                                          context, kLoginRoute);
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    ErrorSnackbar.show(context, errors[e.code]!);
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

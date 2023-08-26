import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/src/features/authentication/models/UserModel.dart';
import 'package:sloth/src/features/authentication/models/error_firebase_auth.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:sloth/src/widgets/forms/email_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/src/features/authentication/views/widgets/loginPassword_input.dart';
import 'package:sloth/src/widgets/snackbars/errorSnackbar.dart';
import 'package:sloth/src/widgets/snackbars/welcomeSnackbar.dart';

class LoginForm extends StatelessWidget {
  final UserModel _userModel = UserModel();

  LoginForm({Key? key}) : super(key: key);
  final _loginFormKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  late Map user = {};

  Future<void> getUser() async {
    final user_id = FirebaseAuth.instance.currentUser!.uid;
    user = await _userModel.getUserFullName(user_id);
    setState(){user;};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorCream,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                          Text(AppLocalizations.of(context)!.login__introText,
                              style: kBigLabelTextStyle,
                              textAlign: TextAlign.center),
                        ],
                      ),
                      // Formulaire de connection
                      Form(
                        key: _loginFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Email
                            Text(
                              AppLocalizations.of(context)!.login__emailLabel,
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

                            // Mot de passe
                            Text(
                              AppLocalizations.of(context)!.login__mdpLabel,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallHorizontalSpacer,
                            ),
                            LoginPasswordInput(onChanged: (value) {_password = value;}, email:_email, password:_password),
                            const SizedBox(
                              height: kMicroVerticalSpacer*2,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, kResetPasswordRoute);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.login__forgotMdpButton,
                                style: kSmallLinkGreenText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Bouton
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, kRegisterRoute);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.login__registerButton,
                              style: kSmallLinkGreenText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Button(
                              label: AppLocalizations.of(context)!.login__button,
                              onPressed: () async {
                                if (_loginFormKey.currentState != null && _loginFormKey.currentState!.validate()) {
                                  try {
                                    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password).then((value) {
                                      Navigator.pushNamed(context, kHomeRoute);
                                      WelcomeSnackbar.show(context, AppLocalizations.of(context)!.snackBar__loginMessage);
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    ErrorSnackbar.show(context, errors[e.code]!);
                                  }
                                }
                              }),
                        ],
                      ),
                    ],
                  ))),
        ));
  }
}

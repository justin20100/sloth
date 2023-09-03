import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/src/features/authentication/controllers/loginController.dart';
import 'package:sloth/src/features/authentication/views/widgets/loginEmail_input.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/src/features/authentication/views/widgets/loginPassword_input.dart';
import 'package:sloth/src/widgets/snackbars/welcome_snackbar.dart';
import 'package:sloth/src/widgets/error_text.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final EmailInputController emailInputController = EmailInputController();
  final PasswordInputController passwordInputController = PasswordInputController();

  final _loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";

  Future<void> _submitForm() async {
    bool isValid = true;
    setState(() {
      isValid = emailInputController.validate(context, _email) && isValid;
      isValid = passwordInputController.validate(context, _password) && isValid;
    });
    if (isValid) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password).then((value) {
          Navigator.pushNamed(context, kHomeRoute);
          WelcomeSnackbar.show(context, AppLocalizations.of(context)!.snackBar__loginMessage);
        });
      } catch (e) {
        setState(() {
          emailInputController.error = "Impossible, vérifiez votre email";
          passwordInputController.error = "Impossible, vérifiez votre mot de passe";
        });
      }
    }
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
                  padding: const EdgeInsets.only(left: kNormalHorizontalSpacer, right: kNormalHorizontalSpacer),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Logo et texte
                      Column(
                        children: [
                          const Image(
                            image: AssetImage('assets/img/logo.png'),
                          ),
                          Text(AppLocalizations.of(context)!.login__introText, style: kBigLabelTextStyle, textAlign: TextAlign.center),
                        ],
                      ),
                      // Formulaire de connection
                      Form(
                        key: _loginFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Email input
                            Text(
                              AppLocalizations.of(context)!.login__emailLabel,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallHorizontalSpacer,
                            ),
                            LoginEmailInput(
                              initialValue: _email,
                              onChanged: (value) {
                                _email = value;
                              },
                            ),
                            emailInputController.error != null
                                ? ErrorText(text: emailInputController.error!)
                                : const SizedBox(
                                    height: 0,
                                  ),
                            const SizedBox(
                              height: kNormalHorizontalSpacer,
                            ),

                            // Password input
                            Text(
                              AppLocalizations.of(context)!.login__mdpLabel,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallHorizontalSpacer,
                            ),
                            LoginPasswordInput(
                              initialValue: _password,
                              onChanged: (value) {
                                _password = value;
                              },
                            ),
                            passwordInputController.error != null
                                ? ErrorText(text: passwordInputController.error!)
                                : const SizedBox(
                                    height: 0,
                                  ),
                            const SizedBox(
                              height: kMicroVerticalSpacer * 2,
                            ),
                            // Reset password link
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, kResetPasswordRoute);
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
                              onPressed: () {
                                _submitForm();
                              }),
                        ],
                      ),
                    ],
                  ))),
        ));
  }
}

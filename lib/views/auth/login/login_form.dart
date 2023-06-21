
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/login/loginPassword_input.dart';
import '../../../models/UserModel.dart';
import '../../../models/error_firebase_auth.dart';
import '../../../partials/forms/email_input.dart';
import '../../../partials/forms/password_input.dart';
import '../../../routes/routes.dart';
import '../../../styles/constants.dart';
import '../../../tools/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            elevation: 20,
                                            duration: const Duration(seconds: 15),
                                            backgroundColor: kColorGreen,
                                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft:Radius.circular(35), topRight:Radius.circular(35))),
                                            content: Container(
                                              color: kColorGreen,
                                                child: Column(
                                                  children: [
                                                    Image(
                                                      image: AssetImage('assets/img/logowhite.png'),
                                                    ),
                                                    SizedBox(height: kSmallVerticalSpacer,),
                                                    Text(
                                                      'Bonjour nous sommes contents de vous revoir sur Sloth. Nous espérons vous aider au maximum a nouveau.',
                                                      style: TextStyle(color: kColorWhite, fontSize: 16, height: 1.5),
                                                    ),
                                                    SizedBox(height: kNormalVerticalSpacer,),
                                                  ],
                                                )
                                            )),
                                      );
                                      Navigator.pushNamed(context, kHomeRoute);
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
                                          backgroundColor:
                                          Colors.redAccent),
                                    );
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

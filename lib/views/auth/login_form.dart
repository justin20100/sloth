import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/UserModel.dart';
import '../../models/error_firebase_auth.dart';
import '../../partials/forms/email_input.dart';
import '../../partials/forms/password_input.dart';
import '../../routes/routes.dart';
import '../../styles/constants.dart';
import '../../tools/button.dart';

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
                        children: const [
                          Image(
                            image: AssetImage('assets/img/logo.png'),
                          ),
                          Text('Sloth est prêt a vous aider a nouveau !',
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
                            const Text(
                              "Email",
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
                            const Text(
                              "Mot de passe",
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallHorizontalSpacer,
                            ),
                            PasswordInput(onChanged: (value) {
                              _password = value;
                            }),
                            const SizedBox(
                              height: kMicroVerticalSpacer*2,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, kResetPasswordRoute);
                              },
                              child: const Text(
                                'Mot de passe oublié',
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
                            child: const Text(
                              'Créer un compte',
                              style: kSmallLinkGreenText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Button(
                              label: "Se connecter",
                              onPressed: () async {
                                if (_loginFormKey.currentState != null && _loginFormKey.currentState!.validate()) {
                                  try {
                                    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password).then((value) {
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                          backgroundColor:kColorGreen,
                                          duration: Duration(seconds: 15),
                                          content: Text('Bonjour, nous sommes content de vous voir a nouveau sur Sloth.', style: TextStyle(color: kColorWhite, fontFamily: 'Inter'),)
                                      ),);
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

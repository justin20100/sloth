import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/error_firebase_auth.dart';
import '../../partials/forms/email_input.dart';
import '../../partials/forms/password_input.dart';
import '../../routes/routes.dart';
import '../../styles/constants.dart';
import '../../tools/button.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final _loginFormKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

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
                          Text('Sloth est prêt a vous aider a nouveau !',
                              style: kBigGreenText,
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
                              height: kMicroVerticalSpacer,
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
                            const SizedBox(
                              height: kSmallHorizontalSpacer * 5,
                            ),

                            // Bouton
                            Center(
                              child: Button(
                                  label: "Se connecter",
                                  onPressed: () async {
                                    if (_loginFormKey.currentState != null && _loginFormKey.currentState!.validate()) {
                                      try {
                                        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password).then((value) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Bonjour ${FirebaseAuth.instance.currentUser!.email}')),);
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
                            ),
                            const SizedBox(
                              height: kMicroVerticalSpacer * 2,
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
        ));
  }
}

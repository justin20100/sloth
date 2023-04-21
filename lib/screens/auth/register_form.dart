import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/error_firebase_auth.dart';
import '../../partials/forms/email_input.dart';
import '../../partials/forms/password_input.dart';
import '../../partials/forms/username_input.dart';
import '../../routes/routes.dart';
import '../../styles/constants.dart';
import '../../tools/button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _registerFormKey = GlobalKey<FormState>();
  String _userName = "";
  String _email = "daniel.schreurs@hotmail.com";
  String _password = "1234567890";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _registerFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSmallHorizontalSpacer, vertical: 0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: kSmallVerticalSpacer * 3, bottom: kSmallVerticalSpacer / 2),
                  padding: const EdgeInsets.symmetric(
                    vertical: kSmallVerticalSpacer / 2,
                    horizontal: kSmallHorizontalSpacer,
                  ),
                  decoration: BoxDecoration(
                      color: kColorDarkGreen,
                      boxShadow: kBoxShadowItem,
                      borderRadius: kBorderRadiusItem),
                  child: Column(
                    children: [
                      UserNameInput(
                        onChanged: (value) {
                          _userName = value;
                        },
                      ),
                      const Divider(
                        color: kMainTextColor,
                        height: kSmallVerticalSpacer * 2,
                      ),
                      EmailInput(
                        onChanged: (value) {
                          _email = value;
                        },
                      ),
                      const Divider(
                        color: kMainTextColor,
                        height: kSmallVerticalSpacer * 2,
                      ),
                      PasswordInput(onChanged: (value) {
                        _password = value;
                      }),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, kLoginRoute);
                      },
                      child: const Text(
                        'Se connecter',
                        style: kTitleH1Style,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, kResetPasswordRoute);
                      },
                      child: const Text(
                        'Mot de passe oublié',
                        style: kTitleH1Style,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kSmallVerticalSpacer * 2,
                ),
                Button(
                    label: 'Créer un compte',
                    onPressed: () async {
                      if (_registerFormKey.currentState != null &&
                          _registerFormKey.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _email, password: _password)
                              .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Bonjour ${FirebaseAuth.instance.currentUser!.email}')),
                            );
                            Navigator.pushNamed(context, kHomeRoute);
                          });
                        } on FirebaseAuthException catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                  errors[e.code]!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.redAccent),
                          );
                        }
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

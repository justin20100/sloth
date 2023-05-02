import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/validatedPassword_input.dart';
import '../../partials/forms/email_input.dart';
import '../../partials/forms/password_input.dart';
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
  static String _password = "";
  String _email = "";
  String _validated_password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorCream,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: kNormalHorizontalSpacer*2, right: kNormalHorizontalSpacer*2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  // Logo plus Texte
                  Column(
                    children: const [
                      Image(
                        image: AssetImage('assets/img/logo.png'),
                      ),
                      Text('Inscrivez vous ci dessous.', style: kBigGreenText, textAlign: TextAlign.center),
                    ],
                  ),

                  // Formulaire d'enregistrement
                  Form(
                    key: _registerFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Email
                        const Text("Email", style: kLabelGreenText,),
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
                        const Text("Mot de passe", style: kLabelGreenText,),
                        const SizedBox(
                          height: kSmallHorizontalSpacer,
                        ),
                        PasswordInput(onChanged: (value) {
                          _password = value;
                          setState(() {
                            _password;
                          });
                        }),
                        const SizedBox(
                          height: kNormalHorizontalSpacer,
                        ),

                        // Confirmation du mot de passe
                        const Text("Confirmation du mot de passe", style: kLabelGreenText,),
                        const SizedBox(
                          height: kSmallHorizontalSpacer,
                        ),
                        ValidatedPasswordInput(password: _password, onChanged: (value) {_validated_password = value;}),
                        const SizedBox(
                          height: kNormalHorizontalSpacer,
                        ),

                        // Bouton
                        Center(
                          child: Button(
                              label: 'Etape suivante',
                              onPressed: () {
                                if (_registerFormKey.currentState != null && _registerFormKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, kRegisterMoreRoute, arguments: { 'email': _email, 'password': _password }  );
                                }
                              }),
                        ),
                        const SizedBox(
                          height: kMicroVerticalSpacer,
                        ),

                        // Lien vers la pas de connection
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
              )
          )
      ),
    );
  }
}

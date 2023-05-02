import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/firstname_input.dart';
import 'package:sloth/partials/forms/lastname_input.dart';
import 'package:sloth/partials/forms/phone_input.dart';
import '../../models/error_firebase_auth.dart';
import '../../partials/forms/email_input.dart';
import '../../partials/forms/password_input.dart';
import '../../routes/routes.dart';
import '../../styles/constants.dart';
import '../../tools/button.dart';

class RegisterMoreForm extends StatelessWidget {
  RegisterMoreForm({Key? key}) : super(key: key);
  final _registerFormKey = GlobalKey<FormState>();
  String _firstname = "";
  String _lastname = "";
  String _phone = "";


  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: kColorCream,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: kNormalHorizontalSpacer*2, right: kNormalHorizontalSpacer*2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text('Nous avons encore besoins de quelques informations.', style: kBigGreenText, textAlign: TextAlign.center),
                    ],
                  ),
                  Form(
                    key: _registerFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // Prénom
                        const Text("Prénom", style: kLabelGreenText,),
                        const SizedBox(
                          height: kSmallHorizontalSpacer,
                        ),
                        FirstNameInput(
                          onChanged: (value) {
                            _firstname = value;
                          },
                        ),
                        const SizedBox(
                          height: kNormalHorizontalSpacer,
                        ),

                        // Nom
                        const Text("Nom", style: kLabelGreenText,),
                        const SizedBox(
                          height: kSmallHorizontalSpacer,
                        ),
                        LastNameInput(onChanged: (value) {
                          _lastname = value;
                        }),
                        const SizedBox(
                          height: kNormalHorizontalSpacer,
                        ),

                        // Numéro de téléphone facultatif
                        const Text("Numéro de téléhone (facultatif)", style: kLabelGreenText,),
                        const SizedBox(
                          height: kSmallHorizontalSpacer,
                        ),
                        PhoneInput(onChanged: (value) {
                          _phone = value;
                        }),
                        const SizedBox(
                          height: kNormalHorizontalSpacer,
                        ),

                        // Button
                        Center(
                          child: Button(
                            label: 'Etape suivante',
                            onPressed: () {
                              if (_registerFormKey.currentState != null && _registerFormKey.currentState!.validate()) {
                                print(arguments);
                                //Navigator.pushNamed(context, kRegisterMoreRoute, arguments: { 'email': arguments['email'] , 'password': arguments['password']}  );
                              }
                            }),
                        ),
                        const SizedBox(
                          height: kMicroVerticalSpacer,
                        ),

                        // Redirection sur connection
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'retour',
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

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
  String _status = "";

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
                        const Text("Votre email", style: kLabelGreenText,),
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
                        const Text("Votre mot de passe", style: kLabelGreenText,),
                        const SizedBox(
                          height: kSmallHorizontalSpacer,
                        ),
                        LastNameInput(onChanged: (value) {
                          _lastname = value;
                        }),
                        const SizedBox(
                          height: kNormalHorizontalSpacer,
                        ),
                        const Text("Votre mot de passe", style: kLabelGreenText,),
                        const SizedBox(
                          height: kSmallHorizontalSpacer,
                        ),
                        PhoneInput(onChanged: (value) {
                          _phone = value;
                        }),
                        const SizedBox(
                          height: kMicroVerticalSpacer,
                        ),
                        Button(
                            label: 'Etape suivante',
                            onPressed: () {
                              if (_registerFormKey.currentState != null &&
                                  _registerFormKey.currentState!.validate()) {
                                Navigator.pushNamed(context, kRegisterMoreRoute);
                              }
                            }),
                        const SizedBox(
                          height: kMicroVerticalSpacer,
                        ),
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

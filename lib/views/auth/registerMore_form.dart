import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/firstname_input.dart';
import 'package:sloth/partials/forms/lastname_input.dart';
import 'package:sloth/partials/forms/phone_input.dart';
import 'package:sloth/routes/routes.dart';
import '../../styles/constants.dart';
import '../../tools/button.dart';

class RegisterMoreForm extends StatelessWidget {
  RegisterMoreForm({Key? key}) : super(key: key);
  final _registerMoreFormKey = GlobalKey<FormState>();
  String _firstname = "";
  String _lastname = "";
  String _phone = "";

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
                    Column(
                      children: const [
                        Text(
                            'Nous avons encore besoins de quelques informations.',
                            style: kBigGreenText,
                            textAlign: TextAlign.center),
                      ],
                    ),
                    Form(
                      key: _registerMoreFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Prénom
                          const Text(
                            "Prénom",
                            style: kLabelGreenText,
                          ),
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
                          const Text(
                            "Nom",
                            style: kLabelGreenText,
                          ),
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
                          const Text(
                            "Numéro de téléhone (facultatif)",
                            style: kLabelGreenText,
                          ),
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
                                  if (_registerMoreFormKey.currentState !=
                                          null &&
                                      _registerMoreFormKey.currentState!
                                          .validate()) {
                                    Navigator.pushNamed(
                                        context, kRegisterTraitsRoute,
                                        arguments: {
                                          'email': arguments['email'],
                                          'password': arguments['password'],
                                          'firstname': _firstname,
                                          'lastname': _lastname,
                                          'phone': _phone ?? ''
                                        });
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
                              'Retour',
                              style: kSmallLinkGreenText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}

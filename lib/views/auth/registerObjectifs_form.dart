import 'package:flutter/material.dart';
import 'package:sloth/routes/routes.dart';

import '../../styles/constants.dart';
import '../../tools/button.dart';

class RegisterObjectifsForm extends StatelessWidget {
  RegisterObjectifsForm({Key? key}) : super(key: key);
  final _registerObjectifsFormKey = GlobalKey<FormState>();


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
                    key: _registerObjectifsFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // Prénom
                        const Text("Prénom", style: kLabelGreenText,),
                        const SizedBox(
                          height: kSmallHorizontalSpacer,
                        ),



                        // Button
                        Center(
                          child: Button(
                              label: 'Etape suivante',
                              onPressed: () {
                                if (_registerObjectifsFormKey.currentState != null && _registerObjectifsFormKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, kHomeRoute );
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

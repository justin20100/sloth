import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/error_firebase_auth.dart';
import '../../partials/forms/email_input.dart';
import '../../partials/forms/password_input.dart';
import '../../routes/routes.dart';
import '../../styles/constants.dart';
import '../../tools/button.dart';

class Intersection extends StatelessWidget {
  const Intersection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !(Navigator.of(context).userGestureInProgress),
      child: Scaffold(
        backgroundColor: kColorCream,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: kNormalHorizontalSpacer,
                    right: kNormalHorizontalSpacer),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Image(
                      image: AssetImage('assets/img/slothLogo.jpg'),
                    ),
                    const Text(
                        "C'est maintenant que tout commence ou continue.",
                        style: kBigGreenText,
                        textAlign: TextAlign.center),
                    Column(
                      children: [
                        Center(
                          child: Button(
                            label: "S'inscrire",
                            onPressed: () {
                              Navigator.pushNamed(context, kRegisterRoute);
                            },
                          ),
                        ),
                        SizedBox(height: kNormalVerticalSpacer),
                        Center(
                          child: Button(
                            label: "Se connecter",
                            onPressed: () {
                              Navigator.pushNamed(context, kLoginRoute);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}
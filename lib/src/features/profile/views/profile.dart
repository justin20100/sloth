import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorCream,
        appBar: AppBar(
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          toolbarHeight: 80,
          backgroundColor: kColorCream,
          leading: GestureDetector(
            onTap: () => {Navigator.pop(context)},
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kColorGreen,
            ),
          ),
          title: const Text(
            'Profile',
            style: kAppBarTextStyle,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, kChangePasswordRoute);
              },
              child: Text(
                AppLocalizations.of(context)!.profile__linkPassword,
                style: kSmallLinkGreenText,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: kSmallVerticalSpacer),
            Center(
                  child: Button(
                      label: 'Déconnection',
                      onPressed: () => {
                            FirebaseAuth.instance.signOut(),
                            Navigator.popAndPushNamed(
                                context, kIntersectionRoute),
                          })
            ),
          ],
        ));
  }
}
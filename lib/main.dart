import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sloth/routes/router.dart';
import 'package:sloth/routes/routes.dart';
import 'package:sloth/views/error.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            initialRoute: FirebaseAuth.instance.currentUser == null
                ? kIntroductionRoute
                : kHomeRoute,
            routes: router,
            theme: ThemeData(fontFamily: 'Inter'),
          );
        }
        return const ErrorScreen();
      },
    );
  }
}

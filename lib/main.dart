import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sloth/api/notification_api.dart';
import 'package:sloth/src/routing/router.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/utils/error.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationApi.init(initSheduled: true);
  NotificationApi.periodicallyShowNotification(id: 0,title: 'Rapport quotidien disponible', body: "Vous avez jusqu'a midi pour remplir votre rapport du jour", scheduledDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 0, 0));
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
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

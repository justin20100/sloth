import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sloth/routes/routes.dart';
import 'package:sloth/views/start/intersection.dart';
import 'package:sloth/views/auth/profile.dart';
import 'package:sloth/views/auth/register/registerTraits_form.dart';
import 'package:sloth/views/events/dreport_form.dart';
import 'package:sloth/views/calendar.dart';
import '../views/auth/dataUsage.dart';
import '../views/auth/login/login_form.dart';
import '../views/auth/register/registerMore_form.dart';
import '../views/auth/register/registerObjectifs_form.dart';
import '../views/auth/register/register_form.dart';
import '../views/auth/login/resetPassword_form.dart';

import '../views/home.dart';
import '../views/start/introduction.dart';
import '../views/notifications.dart';

Map<String, WidgetBuilder> router = {
  //introduction
  kIntroductionRoute: (context) => Introduction(),
  //auth
  kIntersectionRoute: (context) => Intersection(),
  kRegisterRoute: (context) => RegisterForm(),
  kDataUsageRoute: (context) => DataUsage(),
  kRegisterMoreRoute: (context) => RegisterMoreForm(),
  kRegisterTraitsRoute: (context) => RegisterTraitsForm(),
  kRegisterObjectifsRoute: (context) => RegisterObjectifsForm(),
  kLoginRoute: (context) => LoginForm(),
  kResetPasswordRoute: (context) => ResetPasswordForm(),
  kResetPasswordRoute: (context) => ResetPasswordForm(),
  kProfileRoute: (context) => Profile(),
  // Pages
  kHomeRoute: (context) =>  const Home(),
  kNotificationsRoute: (context) => const Notifications(),
  kCalendarRoute: (context) => const Calendar(),
  // Events
  kDReportRoute: (context) => DReportForm(),

};



goHome({formKey, context}) {
  if (formKey.currentState != null &&
      formKey.currentState!.validate()) {
    if (kDebugMode) {
      Navigator.pushNamed(context, kHomeRoute);
    } else {
      if (kDebugMode) {
        print('KO');
      }
    }
  }
}
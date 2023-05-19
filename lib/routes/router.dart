import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sloth/routes/routes.dart';
import 'package:sloth/views/auth/intersection.dart';
import 'package:sloth/views/auth/profile.dart';
import 'package:sloth/views/auth/registerTraits_form.dart';
import 'package:sloth/views/events/dreport_form.dart';
import 'package:sloth/views/pages/calendar.dart';

import '../views/auth/login_form.dart';
import '../views/auth/registerMore_form.dart';
import '../views/auth/registerObjectifs_form.dart';
import '../views/auth/register_form.dart';
import '../views/auth/resetPassword_form.dart';

import '../views/home.dart';
import '../views/introduction.dart';
import '../views/pages/notifications.dart';

Map<String, WidgetBuilder> router = {
  //introduction
  kIntroductionRoute: (context) => Introduction(),
  //auth
  kIntersectionRoute: (context) => Intersection(),
  kRegisterRoute: (context) => RegisterForm(),
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
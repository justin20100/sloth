import 'package:flutter/material.dart';
import 'package:sloth/src/features/authentification/views/dataUsage.dart';
import 'package:sloth/src/features/authentification/views/login_form.dart';
import 'package:sloth/src/features/authentification/views/registerMore_form.dart';
import 'package:sloth/src/features/authentification/views/registerObjectifs_form.dart';
import 'package:sloth/src/features/authentification/views/registerTraits_form.dart';
import 'package:sloth/src/features/authentification/views/register_form.dart';
import 'package:sloth/src/features/authentification/views/resetPassword_form.dart';
import 'package:sloth/src/features/calendar/views/calendar.dart';
import 'package:sloth/src/features/home/views/home.dart';
import 'package:sloth/src/features/introduction/views/intersection.dart';
import 'package:sloth/src/features/introduction/views/introduction.dart';
import 'package:sloth/src/features/notifications/views/notifications.dart';
import 'package:sloth/src/features/profile/views/changePassword__form.dart';
import 'package:sloth/src/features/profile/views/profile.dart';
import 'package:sloth/src/features/reports/views/dreport_form.dart';
import 'package:sloth/src/routing/routes.dart';

Map<String, WidgetBuilder> router = {
  // introduction
  kIntroductionRoute: (context) => const Introduction(),
  kIntersectionRoute: (context) => const Intersection(),

  // auth - register
  kRegisterRoute: (context) => const RegisterForm(),
  kRegisterMoreRoute: (context) => RegisterMoreForm(),
  kRegisterTraitsRoute: (context) => RegisterTraitsForm(),
  kRegisterObjectifsRoute: (context) => RegisterObjectifsForm(),

  // auth - login
  kLoginRoute: (context) => LoginForm(),
  kDataUsageRoute: (context) => const DataUsage(),
  kResetPasswordRoute: (context) => ResetPasswordForm(),

  // profil
  kProfileRoute: (context) => Profile(),
  kChangePasswordRoute: (context) => ChangePasswordForm(),

  // reports
  kDReportRoute: (context) => const DReportForm(),

  // home
  kHomeRoute: (context) => const Home(),

  // notifications
  kNotificationsRoute: (context) => const Notifications(),

  // calendar
  kCalendarRoute: (context) => const Calendar(),
};

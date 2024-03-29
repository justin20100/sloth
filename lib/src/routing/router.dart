import 'package:flutter/material.dart';
import 'package:sloth/src/features/authentication/views/dataUsage.dart';
import 'package:sloth/src/features/authentication/views/login_form.dart';
import 'package:sloth/src/features/authentication/views/registerMore_form.dart';
import 'package:sloth/src/features/authentication/views/registerObjectifs_form.dart';
import 'package:sloth/src/features/authentication/views/registerTraits_form.dart';
import 'package:sloth/src/features/authentication/views/register_form.dart';
import 'package:sloth/src/features/authentication/views/resetPassword_form.dart';
import 'package:sloth/src/features/calendar/views/calendar.dart';
import 'package:sloth/src/features/history/views/history.dart';
import 'package:sloth/src/features/home/views/home.dart';
import 'package:sloth/src/features/introduction/views/intersection.dart';
import 'package:sloth/src/features/introduction/views/introduction.dart';
import 'package:sloth/src/features/personnalSheet/views/personnalSheet.dart';
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
  kRegisterTraitsRoute: (context) => const RegisterTraitsForm(),
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
  kHistoryRoute: (context) => const History(),

  // calendar
  kCalendarRoute: (context) => const Calendar(),

  // personnal sheet
  kPersonnalSheetRoute: (context) => const PersonnalSheet(),
};

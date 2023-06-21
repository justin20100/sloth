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
  // start
  kIntroductionRoute: (context) => Introduction(),
  kIntersectionRoute: (context) => Intersection(),

  // auth - register
  kRegisterRoute: (context) => RegisterForm(),
  kRegisterMoreRoute: (context) => RegisterMoreForm(),
  kRegisterTraitsRoute: (context) => RegisterTraitsForm(),
  kRegisterObjectifsRoute: (context) => RegisterObjectifsForm(),

  // auth - login
  kLoginRoute: (context) => LoginForm(),
  kDataUsageRoute: (context) => DataUsage(),
  kResetPasswordRoute: (context) => ResetPasswordForm(),
  kProfileRoute: (context) => Profile(),

  // events
  kDReportRoute: (context) => DReportForm(),

  // views
  kHomeRoute: (context) =>  const Home(),
  kNotificationsRoute: (context) => const Notifications(),
  kCalendarRoute: (context) => const Calendar(),
};
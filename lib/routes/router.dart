import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sloth/routes/routes.dart';

import '../views/auth/login_form.dart';
import '../views/auth/registerMore_form.dart';
import '../views/auth/register_form.dart';
import '../views/auth/reset_password_form.dart';

import '../views/home.dart';

Map<String, WidgetBuilder> router = {
  kHomeRoute: (context) =>  const Home(),
  kRegisterRoute: (context) => RegisterForm(),
  kRegisterMoreRoute: (context) => RegisterMoreForm(),
  kLoginRoute: (context) => LoginForm(),
  kResetPasswordRoute: (context) => const ResetPasswordForm(),
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
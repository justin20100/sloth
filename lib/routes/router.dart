import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sloth/routes/routes.dart';

import '../screens/auth/login_form.dart';
import '../screens/auth/register_form.dart';
import '../screens/auth/reset_password_form.dart';

import '../screens/home.dart';

Map<String, WidgetBuilder> router = {
  kHomeRoute: (context) =>  const Home(),
  kRegisterRoute: (context) => const RegisterForm(),
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
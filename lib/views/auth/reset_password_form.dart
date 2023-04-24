import 'package:flutter/material.dart';
import '../../partials/forms/email_input.dart';
import '../../routes/router.dart';
import '../../routes/routes.dart';
import '../../styles/constants.dart';
import '../../tools/button.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _resetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _resetPasswordFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kSmallHorizontalSpacer,
              vertical: 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: kSmallVerticalSpacer * 3, bottom: kSmallVerticalSpacer / 2),
                  padding: const EdgeInsets.symmetric(
                    vertical: kSmallVerticalSpacer / 2,
                    horizontal: kSmallHorizontalSpacer,
                  ),
                  decoration: BoxDecoration(
                      color: kColorBlack,
                      boxShadow: kBoxShadowItem,
                      borderRadius: kBorderRadiusItem),
                  child: Column(
                    children: const [
                      EmailInput(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, kRegisterRoute);
                      },
                      child: const Text(
                        'Créer un compte',
                        style: kBasicTextStyle,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, kLoginRoute);
                      },
                      child: const Text(
                        'Se connecter',
                        style: kBasicTextStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kSmallVerticalSpacer * 2,
                ),
                Button(
                    label: 'Envoyer email de réinitialisation',
                    onPressed: () {
                      goHome(formKey: _resetPasswordFormKey, context: context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ffi';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/src/features/authentication/views/widgets/registerPassword_input.dart';
import 'package:sloth/src/features/authentication/views/widgets/registerValidatePassword_input.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:sloth/src/widgets/forms/email_input.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _registerFormKey = GlobalKey<FormState>();
  static String _password = "";
  String _email = "";
  String _validated_password = "";
  bool _dataUsageAccepted = false;

  get recognizer => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorCream,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.only(
                    left: kNormalHorizontalSpacer,
                    right: kNormalHorizontalSpacer,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Logo and text
                      Column(
                        children: [
                          const Image(
                            image: AssetImage('assets/img/logo.png'),
                          ),
                          Text(
                              AppLocalizations.of(context)!.register__introText,
                              style: kBigLabelTextStyle,
                              textAlign: TextAlign.center),
                        ],
                      ),

                      // Register form
                      Form(
                        key: _registerFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Email
                            Text(
                              AppLocalizations.of(context)!
                                  .register__emailLabel,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallHorizontalSpacer,
                            ),
                            EmailInput(
                              onChanged: (value) {
                                _email = value;
                              },
                            ),
                            const SizedBox(
                              height: kNormalHorizontalSpacer,
                            ),

                            // Mot de passe
                            Text(
                              AppLocalizations.of(context)!.register__mdpLabel,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallHorizontalSpacer,
                            ),
                            RegisterPasswordInput(
                                onChanged: (value) {
                                  _password = value;
                                  setState(() {
                                    _password;
                                  });
                                },
                                password: _password),
                            const SizedBox(
                              height: kNormalHorizontalSpacer,
                            ),

                            // Confirmation du mot de passe
                            Text(
                              AppLocalizations.of(context)!
                                  .register__mdpValidationLabel,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallHorizontalSpacer,
                            ),
                            RegisterValidatePasswordInput(
                                onChanged: (value) {
                                  _validated_password = value;
                                  setState(() {
                                    _password;
                                    _validated_password;
                                  });
                                }, password: _password),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),

                            // Checkbox data infos
                            Row(
                              children: [
                                FormField<bool>(
                                  validator: (value) {
                                    if (_dataUsageAccepted == false) {
                                      return 'Required.';
                                    }
                                  },
                                  builder: (FormFieldState<bool> field) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [

                                        Theme(
                                          data: Theme.of(context).copyWith(
                                            unselectedWidgetColor: Colors.red,
                                          ),
                                          child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide.resolveWith(
                                                  (states) => BorderSide(width: 1.4, color: field.hasError ? kColorRed : kColorGreen,
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(4),
                                            ),
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            value: _dataUsageAccepted,
                                            onChanged: (value) {
                                              setState(() {
                                                _dataUsageAccepted = value!;
                                                field.didChange(value);
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                Expanded(
                                  child: RichText(
                                      text: TextSpan(
                                    text: AppLocalizations.of(context)!
                                        .register__dataUsagePart1,
                                    style: k12BasicTextStyle,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: AppLocalizations.of(context)!
                                            .register__dataUsagePart2,
                                        style: const TextStyle(
                                          color: kColorGreen,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(
                                                context, kDataUsageRoute);
                                          },
                                      ),
                                    ],
                                  )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: kNormalHorizontalSpacer,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, kLoginRoute);
                            },
                            child: Text(
                              AppLocalizations.of(context)!
                                  .register__loginButton,
                              style: kSmallLinkGreenText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Button(
                              label: AppLocalizations.of(context)!
                                  .register__button,
                              onPressed: () {
                                if (_registerFormKey.currentState != null &&
                                    _registerFormKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, kRegisterMoreRoute, arguments: {'email': _email, 'password': _password});
                                }
                              }),
                        ],
                      )
                    ],
                  ))),
        ));
  }
}

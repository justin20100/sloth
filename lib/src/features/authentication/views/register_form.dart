import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/src/features/authentication/controllers/registerController.dart';
import 'package:sloth/src/features/authentication/views/widgets/registerEmail_input.dart';
import 'package:sloth/src/features/authentication/views/widgets/registerPassword_input.dart';
import 'package:sloth/src/features/authentication/views/widgets/registerValidatePassword_input.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:sloth/src/widgets/error_text.dart';
import 'package:sloth/src/widgets/forms/email_input.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final EmailInputController emailInputController = EmailInputController();
  final PasswordInputController passwordInputController = PasswordInputController();
  final ValidatedPasswordInputController validatePasswordInputController = ValidatedPasswordInputController();
  final DataUsageCheckController dataUsageCheckController = DataUsageCheckController();

  final _registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  static String _password = "";
  String _email = "";
  String _validatedPassword = "";
  bool _dataUsageAccepted = false;

  Future<void> _submitForm() async {
    bool isValid = true;
    isValid = await emailInputController.validate(context, _email) && isValid;
    isValid = passwordInputController.validate(context, _password) && isValid;
    isValid = validatePasswordInputController.validate(context, _password, _validatedPassword) && isValid;
    isValid = dataUsageCheckController.validate(context, _dataUsageAccepted) && isValid;
    setState(() {
      emailInputController;
      passwordInputController;
      validatePasswordInputController;
      dataUsageCheckController;
      isValid;
    });
    if (isValid) {
      Navigator.pushNamed(context, kRegisterMoreRoute, arguments: {'email': _email, 'password': _password});
    }
  }

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
                          Text(AppLocalizations.of(context)!.register__introText, style: kBigLabelTextStyle, textAlign: TextAlign.center),
                        ],
                      ),

                      // Register form
                      Form(
                        key: _registerFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Email input
                            Text(
                              AppLocalizations.of(context)!.register__emailLabel,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallHorizontalSpacer,
                            ),
                            RegisterEmailInput(initialValue: _email,onChanged: (value) {
                              _email = value;
                            },),
                            emailInputController.error != null
                                ? ErrorText(text: emailInputController.error!)
                                : const SizedBox(
                                    height: 0,
                                  ),
                            const SizedBox(
                              height: kNormalHorizontalSpacer,
                            ),

                            // Password input
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
                            passwordInputController.error != null
                                ? ErrorText(text: passwordInputController.error!)
                                : const SizedBox(
                                    height: 0,
                                  ),
                            const SizedBox(
                              height: kNormalHorizontalSpacer,
                            ),

                            // Validated password input
                            Text(
                              AppLocalizations.of(context)!.register__mdpValidationLabel,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallHorizontalSpacer,
                            ),
                            RegisterValidatePasswordInput(
                                onChanged: (value) {
                                  _validatedPassword = value;
                                  setState(() {
                                    _password;
                                    _validatedPassword;
                                  });
                                },
                                password: _password),
                            validatePasswordInputController.error != null
                                ? ErrorText(text: validatePasswordInputController.error!)
                                : const SizedBox(
                                    height: 0,
                                  ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),

                            // Data usage checkbox
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: kColorGreen,
                                  checkColor: kColorYellow,
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                      width: 1.4,
                                      color: dataUsageCheckController.error != null ? kColorRed : kColorGreen,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  value: _dataUsageAccepted,
                                  onChanged: (value) {
                                    setState(() {
                                      _dataUsageAccepted = value!;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: RichText(
                                      text: TextSpan(
                                    text: AppLocalizations.of(context)!.register__dataUsagePart1,
                                    style: k12BasicTextStyle,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.register__dataUsagePart2,
                                        style: const TextStyle(
                                          color: kColorGreen,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(context, kDataUsageRoute);
                                          },
                                      ),
                                    ],
                                  )),
                                ),
                              ],
                            ),
                            dataUsageCheckController.error != null
                                ? ErrorText(text: dataUsageCheckController.error!)
                                : const SizedBox(
                              height: 0,
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
                              AppLocalizations.of(context)!.register__loginButton,
                              style: kSmallLinkGreenText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Button(
                              label: AppLocalizations.of(context)!.register__button,
                              onPressed: () {
                                _submitForm();
                              }),
                        ],
                      )
                    ],
                  ))),
        ));
  }
}

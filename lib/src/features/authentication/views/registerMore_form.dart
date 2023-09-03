import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/src/features/authentication/controllers/RegisterMoreController.dart';
import 'package:sloth/src/features/authentication/views/widgets/registerPhone_input.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:sloth/src/features/authentication/views/widgets/registerFirstname_input.dart';
import 'package:sloth/src/features/authentication/views/widgets/registerLastname_input.dart';
import 'package:sloth/src/widgets/error_text.dart';

class RegisterMoreForm extends StatefulWidget {
  RegisterMoreForm({Key? key}) : super(key: key);

  @override
  State<RegisterMoreForm> createState() => _RegisterMoreFormState();
}

class _RegisterMoreFormState extends State<RegisterMoreForm> {



  final FirstnameInputController firstnameInputController = FirstnameInputController();
  final LastnameInputController lastnameInputController = LastnameInputController();
  final PhoneInputController phoneInputController = PhoneInputController();

  final _registerMoreFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  String _firstname = "";
  String _lastname = "";
  String _phone = "";

  _submitForm() {
    bool isValid = true;
    setState(() {
      isValid = firstnameInputController.validate(context, _firstname) && isValid;
      isValid = lastnameInputController.validate(context, _lastname) && isValid;
      isValid = phoneInputController.validate(context, _phone) && isValid;
    });
    if (isValid) {
      Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      print(arguments);
      Navigator.pushNamed(context, kRegisterTraitsRoute, arguments: {'email': arguments['email'], 'password': arguments['password'], 'firstname': _firstname, 'lastname': _lastname, 'phone': _phone});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorCream,
      body: SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: kNormalHorizontalSpacer,
                    right: kNormalHorizontalSpacer
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/img/logo.png'),
                        ),
                        Text(
                            AppLocalizations.of(context)!.registerMore__introText,
                            style: kBigLabelTextStyle,
                            textAlign: TextAlign.center),
                      ],
                    ),
                    Form(
                      key: _registerMoreFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Firstname
                          Text(
                            AppLocalizations.of(context)!.registerMore__firstNameLabel,
                            style: kLabelGreenText,
                          ),
                          const SizedBox(
                            height: kSmallHorizontalSpacer,
                          ),
                          FirstNameInput(
                            onChanged: (value) {
                              _firstname = value;
                            },
                          ),
                          firstnameInputController.error != null
                              ? ErrorText(text: firstnameInputController.error!)
                              : const SizedBox(
                            height: 0,
                          ),
                          const SizedBox(
                            height: kNormalHorizontalSpacer,
                          ),

                          // Lastname
                          Text(
                            AppLocalizations.of(context)!.registerMore__lastNameLabel,
                            style: kLabelGreenText,
                          ),
                          const SizedBox(
                            height: kSmallHorizontalSpacer,
                          ),
                          LastNameInput(onChanged: (value) {
                            _lastname = value;
                          }),
                          lastnameInputController.error != null
                              ? ErrorText(text: lastnameInputController.error!)
                              : const SizedBox(
                            height: 0,
                          ),
                          const SizedBox(
                            height: kNormalHorizontalSpacer,
                          ),

                          // Phone non required
                          Text(
                            AppLocalizations.of(context)!.registerMore__phoneLabel,
                            style: kLabelGreenText,
                          ),
                          const SizedBox(
                            height: kSmallHorizontalSpacer,
                          ),
                          PhoneInput(
                              onChanged: (value) {
                            _phone = value;
                          }),
                          phoneInputController.error != null
                              ? ErrorText(text: phoneInputController.error!)
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
                            Navigator.pop(context);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.registerMore__backButton,
                            style: kSmallLinkGreenText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Button(
                            label: AppLocalizations.of(context)!.registerMore__button,
                            onPressed: () {
                              _submitForm();
                            }),
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}

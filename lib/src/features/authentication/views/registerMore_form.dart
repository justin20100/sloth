import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/src/features/authentication/views/widgets/registerPhone_input.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:sloth/src/features/authentication/views/widgets/registerFirstname_input.dart';
import 'package:sloth/src/features/authentication/views/widgets/registerLastname_input.dart';

class RegisterMoreForm extends StatelessWidget {
  RegisterMoreForm({Key? key}) : super(key: key);
  final _registerMoreFormKey = GlobalKey<FormState>();
  String _firstname = "";
  String _lastname = "";
  String _phone = "";

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
                          // Prénom
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
                          const SizedBox(
                            height: kNormalHorizontalSpacer,
                          ),

                          // Nom
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
                          const SizedBox(
                            height: kNormalHorizontalSpacer,
                          ),

                          // Numéro de téléphone facultatif
                          Text(
                            AppLocalizations.of(context)!.registerMore__phoneLabel,
                            style: kLabelGreenText,
                          ),
                          const SizedBox(
                            height: kSmallHorizontalSpacer,
                          ),
                          PhoneInput(onChanged: (value) {
                            _phone = value;
                          }),
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
                              if (_registerMoreFormKey.currentState !=
                                          null &&
                                      _registerMoreFormKey.currentState!
                                          .validate()) {
                                    Navigator.pushNamed(context, kRegisterTraitsRoute, arguments: {'email': arguments['email'], 'password': arguments['password'], 'firstname': _firstname, 'lastname': _lastname, 'phone': _phone});
                                  }
                            }),
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}

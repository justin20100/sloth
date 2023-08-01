import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/password_input.dart';
import 'package:sloth/routes/routes.dart';
import 'package:sloth/styles/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/tools/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePasswordForm extends StatelessWidget {
  ChangePasswordForm({Key? key}) : super(key: key);
  final _changePasswordForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorCream,
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: kNormalHorizontalSpacer,
                    right: kNormalHorizontalSpacer),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Logo et texte
                    Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/img/logo.png'),
                        ),
                        Text(
                            AppLocalizations.of(context)!
                                .resetPassword__introText,
                            style: kBigLabelTextStyle,
                            textAlign: TextAlign.center),
                      ],
                    ),
                    Form(
                      key: _changePasswordForm,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Email
                          Text(
                            AppLocalizations.of(context)!.changePassword__label,
                            style: kLabelGreenText,
                          ),
                          const SizedBox(
                            height: kSmallHorizontalSpacer,
                          ),
                          const PasswordInput(),
                          const SizedBox(
                            height: kBigVerticalSpacer * 2,
                          ),
                        ],
                      ),
                    ),
                    // Bouton
                    Column(
                      children: [
                        Center(
                          child: Button(
                              label: AppLocalizations.of(context)!
                                  .resetPassword__button,
                              onPressed: () async {}),
                        ),
                        const SizedBox(
                          height: kMicroVerticalSpacer * 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, kLoginRoute);
                          },
                          child: Text(
                            AppLocalizations.of(context)!
                                .resetPassword__backButton,
                            style: kSmallLinkGreenText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}
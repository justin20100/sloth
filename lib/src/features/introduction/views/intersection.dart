import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Intersection extends StatelessWidget {
  const Intersection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !(Navigator.of(context).userGestureInProgress),
      child: Scaffold(
        backgroundColor: kColorCream,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: kNormalHorizontalSpacer,
                    right: kNormalHorizontalSpacer),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Image(
                      image: AssetImage('assets/img/slothLogo.jpg'),
                    ),
                    Text(
                        AppLocalizations.of(context)!.intersection__introText,
                        style: kBigLabelTextStyle,
                        textAlign: TextAlign.center),
                    Column(
                      children: [
                        Center(
                          child: Button(
                            label: AppLocalizations.of(context)!.intersection__registerButton,
                            onPressed: () {
                              Navigator.pushNamed(context, kRegisterRoute);
                            },
                          ),
                        ),
                        const SizedBox(height: kNormalVerticalSpacer),
                        Center(
                          child: Button(
                            label: AppLocalizations.of(context)!.intersection__loginButton,
                            onPressed: () {
                              Navigator.pushNamed(context, kLoginRoute);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}
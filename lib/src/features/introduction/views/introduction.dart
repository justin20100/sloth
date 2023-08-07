import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  final String _status = 'Waiting...';

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      // Global Page style
      globalBackgroundColor: kColorCream,
      bodyPadding: const EdgeInsets.all(kSmallVerticalSpacer),
      // buttons
      showSkipButton: true,
      skip: Text(
        AppLocalizations.of(context)!.introduction__skipb,
        style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'Inter',
          color: kColorGreen,
          decoration: TextDecoration.none,
        ),
      ),
      showNextButton: true,
      next: const Icon(
        Icons.arrow_forward_rounded,
        color: kColorGreen,
      ),
      showDoneButton: true,
      done: Text(
        AppLocalizations.of(context)!.introduction__doneb,
        style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'Inter',
          color: kColorGreen,
          decoration: TextDecoration.none,
        ),
      ),
      onDone: () => {Navigator.pushNamed(context, kIntersectionRoute)},
      // Indicator
      showBottomPart: true,
      dotsDecorator: const DotsDecorator(
        color: kColorYellow,
        activeColor: kColorGreen,
      ),
      key: _introKey,
      pages: [
        PageViewModel(
          title: AppLocalizations.of(context)!.introduction__title1,
          body: AppLocalizations.of(context)!.introduction__body1,
          image: const Image(
            image: AssetImage('assets/img/slothLogo.jpg'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: kColorGreen,
              decoration: TextDecoration.none,
            ),
            bodyTextStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                color: kColorGreen,
                decoration: TextDecoration.none,
                height: 1.5),
          ),
        ),
        PageViewModel(
          title: AppLocalizations.of(context)!.introduction__title2,
          body: AppLocalizations.of(context)!.introduction__body2,
          image: const Image(
            image: AssetImage('assets/img/calendar.jpg'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: kColorGreen,
              decoration: TextDecoration.none,
            ),
            bodyTextStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                color: kColorGreen,
                decoration: TextDecoration.none,
                height: 1.5),
          ),
        ),
        PageViewModel(
          title: AppLocalizations.of(context)!.introduction__title3,
          body: AppLocalizations.of(context)!.introduction__body3,
          image: const Image(
            image: AssetImage('assets/img/objectifs.jpg'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: kColorGreen,
              decoration: TextDecoration.none,
            ),
            bodyTextStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                color: kColorGreen,
                decoration: TextDecoration.none,
                height: 1.5),
          ),
        ),
        PageViewModel(
          title: AppLocalizations.of(context)!.introduction__title4,
          body: AppLocalizations.of(context)!.introduction__body4,
          image: const Image(
            image: AssetImage('assets/img/symptomes.jpg'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: kColorGreen,
              decoration: TextDecoration.none,
            ),
            bodyTextStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                color: kColorGreen,
                decoration: TextDecoration.none,
                height: 1.5),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../routes/routes.dart';
import '../styles/constants.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  // 1. Define a `GlobalKey` as part of the parent widget's state
  final _introKey = GlobalKey<IntroductionScreenState>();
  String _status = 'Waiting...';

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      // Global Page style
      globalBackgroundColor: kColorCream,
      bodyPadding: const EdgeInsets.all(kSmallVerticalSpacer),
      // buttons
      showSkipButton: true,
      skip: const Text("Passer", style: TextStyle(fontSize: 16.0, fontFamily: 'Inter', color: kColorGreen, decoration: TextDecoration.none,),),
      showNextButton: true,
      next: const Icon(Icons.arrow_forward_rounded, color: kColorGreen,),
      showDoneButton: true,
      done: const Text("Fini", style: TextStyle(fontSize: 16.0, fontFamily: 'Inter', color: kColorGreen, decoration: TextDecoration.none,),),
      onDone: ()=>{Navigator.pushNamed(context, kIntersectionRoute)},
      // Indicator
      showBottomPart: true,
      dotsDecorator: const DotsDecorator(
        color: kColorYellow,
        activeColor: kColorGreen,
      ),
      key: _introKey,
      pages: [
        PageViewModel(
          title: "Bienvenue sur Sloth !",
          body: "",
          image: const Image(
            image: AssetImage('assets/img/slothLogo.jpg'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontFamily: 'Inter', fontSize: 24.0, fontWeight: FontWeight.bold, color: kColorGreen, decoration: TextDecoration.none,),
          ),
        ),
        PageViewModel(
          title: "Structurez votre quotidien pour réduire votre fatigue cognitive.",
          body: "",
          image: const Image(
            image: AssetImage('assets/img/calendar.jpg'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontFamily: 'Inter', fontSize: 24.0, fontWeight: FontWeight.bold, color: kColorGreen, decoration: TextDecoration.none,),
          ),
        ),
        PageViewModel(
          title: "Fixez vous des objectifs a accomplir.",
          body: "",
          image: const Image(
            image: AssetImage('assets/img/objectifs.jpg'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontFamily: 'Inter', fontSize: 24.0, fontWeight: FontWeight.bold, color: kColorGreen, decoration: TextDecoration.none,),
          ),
        ),
        PageViewModel(
          title: "Analysez vos symptômes rapidement.",
          body: "",
          image: const Image(
            image: AssetImage('assets/img/symptomes.jpg'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontFamily: 'Inter', fontSize: 24.0, fontWeight: FontWeight.bold, color: kColorGreen, decoration: TextDecoration.none,),
          ),
        ),
      ],
    );
  }
}
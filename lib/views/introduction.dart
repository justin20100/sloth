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
      done: const Text("Continuer", style: TextStyle(fontSize: 16.0, fontFamily: 'Inter', color: kColorGreen, decoration: TextDecoration.none,),),
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
          body: "Autoévaluez votre ressenti de fatigue cognitive au quotidien, tenez-vous informé sur cette fatigue et partagez vos rapports quotidiens avec une personne de confiance",
          image: const Image(
            image: AssetImage('assets/img/slothLogo.jpg'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontFamily: 'Inter', fontSize: 24.0, fontWeight: FontWeight.bold, color: kColorGreen, decoration: TextDecoration.none,),
            bodyTextStyle: TextStyle(fontFamily: 'Inter', fontSize: 16.0, color: kColorGreen, decoration: TextDecoration.none, height: 1.5),
          ),
        ),
        PageViewModel(
          title: "Structurez vos analyses pour réduire votre fatigue cognitive",
          body: "Un rapport sera disponible tous les matins pour évaluer la veille",
          image: const Image(
            image: AssetImage('assets/img/calendar.jpg'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontFamily: 'Inter', fontSize: 24.0, fontWeight: FontWeight.bold, color: kColorGreen, decoration: TextDecoration.none,),
            bodyTextStyle: TextStyle(fontFamily: 'Inter', fontSize: 16.0, color: kColorGreen, decoration: TextDecoration.none, height: 1.5),
          ),
        ),
        PageViewModel(
          title: "Fixez vous des objectifs à accomplir",
          body: "Choisissez vos objectifs pendant votre inscription et nous vous aiderons à les réaliser",
          image: const Image(
            image: AssetImage('assets/img/objectifs.jpg'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontFamily: 'Inter', fontSize: 24.0, fontWeight: FontWeight.bold, color: kColorGreen, decoration: TextDecoration.none,),
            bodyTextStyle: TextStyle(fontFamily: 'Inter', fontSize: 16.0, color: kColorGreen, decoration: TextDecoration.none, height: 1.5),
          ),
        ),
        PageViewModel(
          title: "Analysez vos symptômes rapidement",
          body: "Une analyse de symptômes est disponible par jour pour en savoir plus sur les éventuels symptômes que vos ressentez",
          image: const Image(
            image: AssetImage('assets/img/symptomes.jpg'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontFamily: 'Inter', fontSize: 24.0, fontWeight: FontWeight.bold, color: kColorGreen, decoration: TextDecoration.none,),
            bodyTextStyle: TextStyle(fontFamily: 'Inter', fontSize: 16.0, color: kColorGreen, decoration: TextDecoration.none, height: 1.5),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sloth/routes/routes.dart';
import '../../styles/constants.dart';
import '../../tools/button.dart';

class RegisterTraitsForm extends StatefulWidget {
  RegisterTraitsForm({Key? key}) : super(key: key);

  @override
  State<RegisterTraitsForm> createState() => _RegisterTraitsFormState();
}

class _RegisterTraitsFormState extends State<RegisterTraitsForm> {
  final _registerTraitsFormKey = GlobalKey<FormState>();

  int _q1 = 0;
  bool q1c1 = false;
  bool q1c2 = false;
  bool q1c3 = false;
  bool q1c4 = false;
  int _q2 = 0;
  bool q2c1 = false;
  bool q2c2 = false;
  bool q2c3 = false;
  bool q2c4 = false;
  int _q3 = 0;
  bool q3c1 = false;
  bool q3c2 = false;
  bool q3c3 = false;
  bool q3c4 = false;
  int _q4 = 0;
  bool q4c1 = false;
  bool q4c2 = false;
  bool q4c3 = false;
  bool q4c4 = false;
  int _q5 = 0;
  bool q5c1 = false;
  bool q5c2 = false;
  bool q5c3 = false;
  bool q5c4 = false;
  int _q6 = 0;
  bool q6c1 = false;
  bool q6c2 = false;
  bool q6c3 = false;
  bool q6c4 = false;
  int _q7 = 0;
  bool q7c1 = false;
  bool q7c2 = false;
  bool q7c3 = false;
  bool q7c4 = false;
  int _q8 = 0;
  bool q8c1 = false;
  bool q8c2 = false;
  bool q8c3 = false;
  bool q8c4 = false;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(

      appBar: AppBar(
          backgroundColor: kColorCream,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded , color: kColorGreen),
            tooltip: 'back to home page',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Echelle de Traits', style: kBigGreenText,)
      ),
      backgroundColor: kColorCream,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: kNormalHorizontalSpacer, right: kNormalHorizontalSpacer),
            child: Column(
              children: [
                // Intro text
                const SizedBox(height: kBigVerticalSpacer,),
                const Text("La fatigue c'est important pour nous. On aimerait donc savoir son implication dans votre vie de tous les jours !", style: k18BasicTextStyle),
                const SizedBox(height: kSmallVerticalSpacer,),
                const Text("De façon générale, quelle est la probabilité de vous assoupir (vous laisser aller doucement au sommeil, vous endormir à moitié) lors des situations suivantes? ", style: k18BasicTextStyle),
                const SizedBox(height: kSmallVerticalSpacer,),
                Row(
                    children:const [
                      Text("\u2022", style: k18BasicTextStyle,), //bullet text
                      SizedBox(width: 10,), //space between bullet and text
                      Expanded(
                        child:Text("jamais", style: k18BasicTextStyle), //text
                      )
                    ]
                ),
                const SizedBox(height: kMicroVerticalSpacer/2,),
                Row(
                    children:const [
                      Text("\u2022", style: k18BasicTextStyle,), //bullet text
                      SizedBox(width: 10,), //space between bullet and text
                      Expanded(
                        child:Text("Peu de chance", style: k18BasicTextStyle), //text
                      )
                    ]
                ),
                const SizedBox(height: kMicroVerticalSpacer/2,),
                Row(
                    children:const [
                      Text("\u2022", style: k18BasicTextStyle,), //bullet text
                      SizedBox(width: 10,), //space between bullet and text
                      Expanded(
                        child:Text("Chance modérée", style: k18BasicTextStyle), //text
                      )
                    ]
                ),
                const SizedBox(height: kMicroVerticalSpacer/2,),
                Row(
                    children:const [
                      Text("\u2022", style: k18BasicTextStyle,), //bullet text
                      SizedBox(width: 10,), //space between bullet and text
                      Expanded(
                        child:Text("Forte chance", style: k18BasicTextStyle), //text
                      )
                    ]
                ),
                const SizedBox(height: kBigVerticalSpacer,),

                // Form
                Form(
                  key: _registerTraitsFormKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // Question 1
                        const Text("Assis à lire", style: kLabelGreenText,),
                        const SizedBox(height: kSmallVerticalSpacer,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Jamais',style:kCheckboxText, softWrap: true ),
                                  const SizedBox(height: 10,),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => const BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q1c1,
                                        onChanged: (bool? value) {
                                          _q1 = 1;
                                          setState(() {
                                            q1c4 = false;
                                            q1c2 = false;
                                            q1c3 = false;
                                            q1c1 = value!;
                                          });
                                        }),
                                  )

                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Peu de chance',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center ),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q1c2,
                                        onChanged: (bool? value) {
                                          _q1 = 2;
                                          setState(() {
                                            q1c1 = false;
                                            q1c4 = false;
                                            q1c3 = false;
                                            q1c2 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Chance modérée',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q1c3,
                                        onChanged: (bool? value) {
                                          _q1 = 3;
                                          setState(() {
                                            q1c1 = false;
                                            q1c2 = false;
                                            q1c4 = false;
                                            q1c3 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Forte chance',style:kCheckboxText,softWrap: true, textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q1c4,
                                        onChanged: (bool? value) {
                                          _q1 = 4;
                                          setState(() {
                                            q1c1 = false;
                                            q1c2 = false;
                                            q1c3 = false;
                                            q1c4 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: kNormalVerticalSpacer,),

                        // Question 2
                        const Text("Assis à regarder la télévision", style: kLabelGreenText,),
                        const SizedBox(height: kSmallVerticalSpacer,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Jamais',style:kCheckboxText, softWrap: true ),
                                  const SizedBox(height: 10,),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q2c1,
                                        onChanged: (bool? value) {
                                          _q2 = 1;
                                          setState(() {
                                            q2c4 = false;
                                            q2c2 = false;
                                            q2c3 = false;
                                            q2c1 = value!;
                                          });
                                        }),
                                  )

                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Peu de chance',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center ),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q2c2,
                                        onChanged: (bool? value) {
                                          _q2 = 2;
                                          setState(() {
                                            q2c1 = false;
                                            q2c4 = false;
                                            q2c3 = false;
                                            q2c2 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Chance modérée',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q2c3,
                                        onChanged: (bool? value) {
                                          _q2 = 3;
                                          setState(() {
                                            q2c1 = false;
                                            q2c2 = false;
                                            q2c4 = false;
                                            q2c3 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Forte chance',style:kCheckboxText,softWrap: true, textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q2c4,
                                        onChanged: (bool? value) {
                                          _q2 = 4;
                                          setState(() {
                                            q2c1 = false;
                                            q2c2 = false;
                                            q2c3 = false;
                                            q2c4 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: kNormalVerticalSpacer,),

                        // Question 3
                        const Text("Assis inactif dans un lieu public (cinéma, théatre, réunion)", style: kLabelGreenText,),
                        const SizedBox(height: kSmallVerticalSpacer,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Jamais',style:kCheckboxText, softWrap: true ),
                                  const SizedBox(height: 10,),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q3c1,
                                        onChanged: (bool? value) {
                                          _q3 = 1;
                                          setState(() {
                                            q3c4 = false;
                                            q3c2 = false;
                                            q3c3 = false;
                                            q3c1 = value!;
                                          });
                                        }),
                                  )

                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Peu de chance',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center ),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q3c2,
                                        onChanged: (bool? value) {
                                          _q3 = 2;
                                          setState(() {
                                            q3c1 = false;
                                            q3c4 = false;
                                            q3c3 = false;
                                            q3c2 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Chance modérée',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q3c3,
                                        onChanged: (bool? value) {
                                          _q3 = 3;
                                          setState(() {
                                            q3c1 = false;
                                            q3c2 = false;
                                            q3c4 = false;
                                            q3c3 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Forte chance',style:kCheckboxText,softWrap: true, textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q3c4,
                                        onChanged: (bool? value) {
                                          _q3 = 4;
                                          setState(() {
                                            q3c1 = false;
                                            q3c2 = false;
                                            q3c3 = false;
                                            q3c4 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: kNormalVerticalSpacer,),

                        // Question 4
                        const Text("Assis comme passager d'une voiture (ou d'un transport en commun) roulant depuis plus d'une heure sans interruption", style: kLabelGreenText,),
                        const SizedBox(height: kSmallVerticalSpacer,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Jamais',style:kCheckboxText, softWrap: true ),
                                  const SizedBox(height: 10,),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q4c1,
                                        onChanged: (bool? value) {
                                          _q4 = 1;
                                          setState(() {
                                            q4c4 = false;
                                            q4c2 = false;
                                            q4c3 = false;
                                            q4c1 = value!;
                                          });
                                        }),
                                  )

                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Peu de chance',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center ),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q4c2,
                                        onChanged: (bool? value) {
                                          _q4 = 2;
                                          setState(() {
                                            q4c1 = false;
                                            q4c4 = false;
                                            q4c3 = false;
                                            q4c2 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Chance modérée',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q4c3,
                                        onChanged: (bool? value) {
                                          _q4 = 3;
                                          setState(() {
                                            q4c1 = false;
                                            q4c2 = false;
                                            q4c4 = false;
                                            q4c3 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Forte chance',style:kCheckboxText,softWrap: true, textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q4c4,
                                        onChanged: (bool? value) {
                                          _q4 = 4;
                                          setState(() {
                                            q4c1 = false;
                                            q4c2 = false;
                                            q4c3 = false;
                                            q4c4 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: kNormalVerticalSpacer,),

                        // Question 5
                        const Text("Allongé dans l'après-midi lorsque les circonstances le permettent", style: kLabelGreenText,),
                        const SizedBox(height: kSmallVerticalSpacer,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Jamais',style:kCheckboxText, softWrap: true ),
                                  const SizedBox(height: 10,),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q5c1,
                                        onChanged: (bool? value) {
                                          _q5 = 1;
                                          setState(() {
                                            q5c4 = false;
                                            q5c2 = false;
                                            q5c3 = false;
                                            q5c1 = value!;
                                          });
                                        }),
                                  )

                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Peu de chance',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center ),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q5c2,
                                        onChanged: (bool? value) {
                                          _q5 = 2;
                                          setState(() {
                                            q5c1 = false;
                                            q5c4 = false;
                                            q5c3 = false;
                                            q5c2 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Chance modérée',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q5c3,
                                        onChanged: (bool? value) {
                                          _q5 = 3;
                                          setState(() {
                                            q5c1 = false;
                                            q5c2 = false;
                                            q5c4 = false;
                                            q5c3 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Forte chance',style:kCheckboxText,softWrap: true, textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q5c4,
                                        onChanged: (bool? value) {
                                          _q5 = 4;
                                          setState(() {
                                            q5c1 = false;
                                            q5c2 = false;
                                            q5c3 = false;
                                            q5c4 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: kNormalVerticalSpacer,),


                        // Question 6
                        const Text("Assis à parler avec quelqu'un)", style: kLabelGreenText,),
                        const SizedBox(height: kSmallVerticalSpacer,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Jamais',style:kCheckboxText, softWrap: true ),
                                  const SizedBox(height: 10,),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q6c1,
                                        onChanged: (bool? value) {
                                          _q6 = 1;
                                          setState(() {
                                            q6c4 = false;
                                            q6c2 = false;
                                            q6c3 = false;
                                            q6c1 = value!;
                                          });
                                        }),
                                  )

                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Peu de chance',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center ),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q6c2,
                                        onChanged: (bool? value) {
                                          _q6 = 2;
                                          setState(() {
                                            q6c1 = false;
                                            q6c4 = false;
                                            q6c3 = false;
                                            q6c2 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Chance modérée',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q6c3,
                                        onChanged: (bool? value) {
                                          _q6 = 3;
                                          setState(() {
                                            q6c1 = false;
                                            q6c2 = false;
                                            q6c4 = false;
                                            q6c3 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Forte chance',style:kCheckboxText,softWrap: true, textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q6c4,
                                        onChanged: (bool? value) {
                                          _q6 = 4;
                                          setState(() {
                                            q6c1 = false;
                                            q6c2 = false;
                                            q6c3 = false;
                                            q6c4 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: kNormalVerticalSpacer,),


                        // Question 7
                        const Text("Assis au calme après un repas sans alcool", style: kLabelGreenText,),
                        const SizedBox(height: kSmallVerticalSpacer,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Jamais',style:kCheckboxText, softWrap: true ),
                                  const SizedBox(height: 10,),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q7c1,
                                        onChanged: (bool? value) {
                                          _q7 = 1;
                                          setState(() {
                                            q7c4 = false;
                                            q7c2 = false;
                                            q7c3 = false;
                                            q7c1 = value!;
                                          });
                                        }),
                                  )

                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Peu de chance',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center ),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q7c2,
                                        onChanged: (bool? value) {
                                          _q7 = 2;
                                          setState(() {
                                            q7c1 = false;
                                            q7c4 = false;
                                            q7c3 = false;
                                            q7c2 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Chance modérée',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q7c3,
                                        onChanged: (bool? value) {
                                          _q7 = 3;
                                          setState(() {
                                            q7c1 = false;
                                            q7c2 = false;
                                            q7c4 = false;
                                            q7c3 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Forte chance',style:kCheckboxText,softWrap: true, textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q7c4,
                                        onChanged: (bool? value) {
                                          _q7 = 4;
                                          setState(() {
                                            q7c1 = false;
                                            q7c2 = false;
                                            q7c3 = false;
                                            q7c4 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: kNormalVerticalSpacer,),


                        // Question 8
                        const Text("Dans une voiture arrêtée dans le trafic ou au feu rouge", style: kLabelGreenText,),
                        const SizedBox(height: kSmallVerticalSpacer,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Jamais',style:kCheckboxText, softWrap: true ),
                                  const SizedBox(height: 10,),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q8c1,
                                        onChanged: (bool? value) {
                                          _q8 = 1;
                                          setState(() {
                                            q8c4 = false;
                                            q8c2 = false;
                                            q8c3 = false;
                                            q8c1 = value!;
                                          });
                                        }),
                                  )

                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Peu de chance',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center ),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q8c2,
                                        onChanged: (bool? value) {
                                          _q8 = 2;
                                          setState(() {
                                            q8c1 = false;
                                            q8c4 = false;
                                            q8c3 = false;
                                            q8c2 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Chance modérée',style:kCheckboxText,softWrap: true ,textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q8c3,
                                        onChanged: (bool? value) {
                                          _q8 = 3;
                                          setState(() {
                                            q8c1 = false;
                                            q8c2 = false;
                                            q8c4 = false;
                                            q8c3 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer*2, right: kSmallHorizontalSpacer),
                              decoration: kBoxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Forte chance',style:kCheckboxText,softWrap: true, textAlign: TextAlign.center),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        activeColor: kColorGreen,
                                        checkColor: kColorYellow,
                                        side: MaterialStateBorderSide.resolveWith(
                                              (states) => BorderSide(width:0.8, color: kColorGreen),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        value: q8c4,
                                        onChanged: (bool? value) {
                                          _q8 = 4;
                                          setState(() {
                                            q8c1 = false;
                                            q8c2 = false;
                                            q8c3 = false;
                                            q8c4 = value!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: kBigVerticalSpacer,),
                      ]
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Button(
                      label: 'Derniere etape',
                      onPressed: () {
                        if (_registerTraitsFormKey.currentState != null && _registerTraitsFormKey.currentState!.validate()) {
                          Navigator.pushNamed(context, kRegisterObjectifsRoute, arguments: {
                            'email': arguments['email'],
                            'password': arguments['password'],
                            'firstname': arguments['firstname'],
                            'lastname':arguments['lastname'],
                            'phone':arguments['phone'],
                            'q1':_q1,
                            'q2':_q2,
                            'q3':_q3,
                            'q4':_q4,
                            'q5':_q5,
                            'q6':_q6,
                            'q7':_q7,
                            'q8':_q8,
                          });
                        }
                      }),
                ),
                const SizedBox(height: kBigVerticalSpacer,),
              ],
            )
        ),
      )
      );
  }
}

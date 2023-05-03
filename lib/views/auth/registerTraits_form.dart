import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    //final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kSmallVerticalSpacer, right: kSmallHorizontalSpacer),
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
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kSmallVerticalSpacer, right: kSmallHorizontalSpacer),
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
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kSmallVerticalSpacer, right: kSmallHorizontalSpacer),
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
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kSmallVerticalSpacer, right: kSmallHorizontalSpacer),
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
                        const SizedBox(height: kNormalHorizontalSpacer,),

                        // Question 2
                        const Text("Assis à lire", style: kLabelGreenText,),
                        const SizedBox(height: kSmallVerticalSpacer,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 75,
                              height: 90,
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kSmallVerticalSpacer, right: kSmallHorizontalSpacer),
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
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kSmallVerticalSpacer, right: kSmallHorizontalSpacer),
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
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kSmallVerticalSpacer, right: kSmallHorizontalSpacer),
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
                              padding: const EdgeInsets.only(left: kSmallHorizontalSpacer, top: kSmallVerticalSpacer, right: kSmallHorizontalSpacer),
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
                        const SizedBox(height: kNormalHorizontalSpacer,),
                      ]
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Button(
                      label: 'Derniere etape',
                      onPressed: () {
                        if (_registerTraitsFormKey.currentState != null && _registerTraitsFormKey.currentState!.validate()) {
                          //Navigator.pushNamed(context, kRegisterMoreRoute, arguments: { 'email': arguments['email'] , 'password': arguments['password']}  );
                        }
                      }),
                ),
              ],
            )
        ),
      )
      );
  }
}

import 'package:flutter/material.dart';
import 'package:sloth/routes/routes.dart';

import '../../styles/constants.dart';
import '../../tools/button.dart';

class RegisterObjectifsForm extends StatefulWidget {
  RegisterObjectifsForm({Key? key}) : super(key: key);

  @override
  State<RegisterObjectifsForm> createState() => _RegisterObjectifsFormState();
}

class _RegisterObjectifsFormState extends State<RegisterObjectifsForm> {
  final _registerObjectifsFormKey = GlobalKey<FormState>();
  bool o1 = false;
  bool o2 = false;
  bool o3 = false;
  bool o4 = false;
  bool o5 = false;
  bool o6 = false;
  bool o7 = false;
  bool o8 = false;
  bool o9 = false;
  bool o10 = false;

  @override
  Widget build(BuildContext context) {
    //final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: kColorCream,
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
          title: const Text('Objectifs', style: kBigGreenText,)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: kNormalHorizontalSpacer, right: kNormalHorizontalSpacer),
          child: Column(
            children: [
              // Intro text
              const SizedBox(height: kBigVerticalSpacer,),
              const Text("Qu'est ce que vous aimeriez accomplir avec Sloth ? Quels sont vos objectifs ? Cochez les objectifs qui correspondent aux votres.", style: k18BasicTextStyle),
              const SizedBox(height: kBigVerticalSpacer,),

              // Objectifs list
              Container(
                // decoration: BoxDecoration(
                //   boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
                // spreadRadius: 5,
                // blurRadius: 7,
                // offset: Offset(0, 3),
                // )]),
                child:CheckboxListTile(
                  title: o1 ? const Text('Me sentir plus heureux',style: TextStyle(color: kColorWhite, fontSize: 14)) : const Text('Me sentir plus heureux',style: TextStyle(color: kColorGreen , fontSize: 14)),
                  tileColor: o1 ? kColorGreen : kColorWhite,
                  value: o1,
                  checkColor: kColorYellow,
                  activeColor:kColorGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                        (states) => o1 ? const BorderSide(width:1, color: kColorWhite):const BorderSide(width:1, color: kColorGreen),
                  ),
                  onChanged: (bool? value) {
                    setState(() {
                      o1 = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: kMicroVerticalSpacer,),
              CheckboxListTile(
                title: o2 ? const Text('Avoir une meilleure qualité de vie',style: TextStyle(color: kColorWhite, fontSize: 14)) : const Text('Avoir une meilleure qualité de vie',style: TextStyle(color: kColorGreen, fontSize: 14)),
                tileColor: o2 ? kColorGreen : kColorWhite,
                value: o2,
                checkColor: kColorYellow,
                activeColor:kColorGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: MaterialStateBorderSide.resolveWith(
                      (states) => o2 ? const BorderSide(width:1, color: kColorWhite):const BorderSide(width:1, color: kColorGreen),
                ),
                onChanged: (bool? value) {
                  setState(() {
                    o2 = value!;
                  });
                },
              ),
              const SizedBox(height: kMicroVerticalSpacer,),
              CheckboxListTile(
                title: o3 ? const Text('Avoir plus d’énergie',style: TextStyle(color: kColorWhite, fontSize: 14)) : const Text('Avoir plus d’énergie',style: TextStyle(color: kColorGreen, fontSize: 14)),
                tileColor: o3 ? kColorGreen : kColorWhite,
                value: o3,
                checkColor: kColorYellow,
                activeColor:kColorGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: MaterialStateBorderSide.resolveWith(
                      (states) => o3 ? const BorderSide(width:1, color: kColorWhite):const BorderSide(width:1, color: kColorGreen),
                ),
                onChanged: (bool? value) {
                  setState(() {
                    o3 = value!;
                  });
                },
              ),
              const SizedBox(height: kMicroVerticalSpacer,),
              CheckboxListTile(
                title: o4 ? const Text('Travailler de façon optimal',style: TextStyle(color: kColorWhite, fontSize: 14)) : const Text('Travailler de façon optimal',style: TextStyle(color: kColorGreen, fontSize: 14)),
                tileColor: o4 ? kColorGreen : kColorWhite,
                value: o4,
                checkColor: kColorYellow,
                activeColor:kColorGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: MaterialStateBorderSide.resolveWith(
                      (states) => o3 ? const BorderSide(width:1, color: kColorWhite):const BorderSide(width:1, color: kColorGreen),
                ),
                onChanged: (bool? value) {
                  setState(() {
                    o4 = value!;
                  });
                },
              ),
              const SizedBox(height: kMicroVerticalSpacer,),
              CheckboxListTile(
                title: o5 ? const Text('Avoir un meilleur sommeil',style: TextStyle(color: kColorWhite, fontSize: 14)) : const Text('Avoir un meilleur sommeil',style: TextStyle(color: kColorGreen, fontSize: 14)),
                tileColor: o5 ? kColorGreen : kColorWhite,
                value: o5,
                checkColor: kColorYellow,
                activeColor:kColorGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: MaterialStateBorderSide.resolveWith(
                      (states) => o5 ? const BorderSide(width:1, color: kColorWhite):const BorderSide(width:1, color: kColorGreen),
                ),
                onChanged: (bool? value) {
                  setState(() {
                    o5 = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/models/UserModel.dart';
import 'package:sloth/routes/routes.dart';

import '../../styles/constants.dart';
import '../../tools/button.dart';

class RegisterObjectifsForm extends StatefulWidget {
  RegisterObjectifsForm({Key? key}) : super(key: key);

  @override
  State<RegisterObjectifsForm> createState() => _RegisterObjectifsFormState();
}

class _RegisterObjectifsFormState extends State<RegisterObjectifsForm> {
  final UserModel _userModel = UserModel();
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
    final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: kColorCream,
      appBar: AppBar(
          backgroundColor: kColorCream,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: kColorGreen),
            tooltip: 'back to home page',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Objectifs',
            style: kBigGreenText,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: kNormalHorizontalSpacer, right: kNormalHorizontalSpacer),
          child: Column(
            children: [
              // Intro text
              const SizedBox(
                height: kBigVerticalSpacer,
              ),
              const Text(
                  "Qu'est ce que vous aimeriez accomplir avec Sloth ? Quels sont vos objectifs ? Cochez les objectifs qui correspondent aux votres.",
                  style: k18BasicTextStyle),
              const SizedBox(
                height: kBigVerticalSpacer,
              ),

              Form(
                key: _registerObjectifsFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Objectifs list
                      Material(
                        elevation: 2.0,
                        shadowColor: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        child: CheckboxListTile(
                          title: o1
                              ? const Text('Me sentir plus heureux',
                              style: TextStyle(color: kColorWhite, fontSize: 14))
                              : const Text('Me sentir plus heureux',
                              style: TextStyle(color: kColorGreen, fontSize: 14)),
                          tileColor: o1 ? kColorGreen : kColorWhite,
                          value: o1,
                          checkColor: kColorYellow,
                          activeColor: kColorGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => o1
                                ? const BorderSide(width: 1, color: kColorWhite)
                                : const BorderSide(width: 1, color: kColorGreen),
                          ),
                          onChanged: (bool? value) {
                            setState(() {
                              o1 = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: kMicroVerticalSpacer * 2,
                      ),
                      Material(
                        elevation: 2.0,
                        shadowColor: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        child: CheckboxListTile(
                          title: o2
                              ? const Text('Avoir une meilleure qualité de vie',
                              style: TextStyle(color: kColorWhite, fontSize: 14))
                              : const Text('Avoir une meilleure qualité de vie',
                              style: TextStyle(color: kColorGreen, fontSize: 14)),
                          tileColor: o2 ? kColorGreen : kColorWhite,
                          value: o2,
                          checkColor: kColorYellow,
                          activeColor: kColorGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => o2
                                ? const BorderSide(width: 1, color: kColorWhite)
                                : const BorderSide(width: 1, color: kColorGreen),
                          ),
                          onChanged: (bool? value) {
                            setState(() {
                              o2 = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: kMicroVerticalSpacer*2,
                      ),
                      Material(
                        elevation: 2.0,
                        shadowColor: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        child: CheckboxListTile(
                          title: o3
                              ? const Text('Avoir plus d’énergie',
                              style: TextStyle(color: kColorWhite, fontSize: 14))
                              : const Text('Avoir plus d’énergie',
                              style: TextStyle(color: kColorGreen, fontSize: 14)),
                          tileColor: o3 ? kColorGreen : kColorWhite,
                          value: o3,
                          checkColor: kColorYellow,
                          activeColor: kColorGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => o3
                                ? const BorderSide(width: 1, color: kColorWhite)
                                : const BorderSide(width: 1, color: kColorGreen),
                          ),
                          onChanged: (bool? value) {
                            setState(() {
                              o3 = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: kMicroVerticalSpacer*2,
                      ),
                      Material(
                        elevation: 2.0,
                        shadowColor: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        child: CheckboxListTile(
                          title: o4
                              ? const Text('Travailler de façon optimal',
                              style: TextStyle(color: kColorWhite, fontSize: 14))
                              : const Text('Travailler de façon optimal',
                              style: TextStyle(color: kColorGreen, fontSize: 14)),
                          tileColor: o4 ? kColorGreen : kColorWhite,
                          value: o4,
                          checkColor: kColorYellow,
                          activeColor: kColorGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => o3
                                ? const BorderSide(width: 1, color: kColorWhite)
                                : const BorderSide(width: 1, color: kColorGreen),
                          ),
                          onChanged: (bool? value) {
                            setState(() {
                              o4 = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: kMicroVerticalSpacer*2,
                      ),
                      Material(
                        elevation: 2.0,
                        shadowColor: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        child: CheckboxListTile(
                          title: o5
                              ? const Text('Avoir un meilleur sommeil',
                              style: TextStyle(color: kColorWhite, fontSize: 14))
                              : const Text('Avoir un meilleur sommeil',
                              style: TextStyle(color: kColorGreen, fontSize: 14)),
                          tileColor: o5 ? kColorGreen : kColorWhite,
                          value: o5,
                          checkColor: kColorYellow,
                          activeColor: kColorGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => o5
                                ? const BorderSide(width: 1, color: kColorWhite)
                                : const BorderSide(width: 1, color: kColorGreen),
                          ),
                          onChanged: (bool? value) {
                            setState(() {
                              o5 = value!;
                            });
                          },
                        ),
                      ),
                      // Button
                      Center(
                        child: Button(
                            label: 'Terminer',
                            onPressed: () async {
                              if (_registerObjectifsFormKey.currentState != null && _registerObjectifsFormKey.currentState!.validate()) {
                                await FirebaseAuth.instance.createUserWithEmailAndPassword(email: arguments['email'], password: arguments['password']);
                                final user_id = FirebaseAuth.instance.currentUser!.uid;
                                _userModel.createUser(
                                    arguments['firstname'],
                                    arguments['lastname'],
                                    arguments['email'],
                                    arguments['phone'],
                                    {
                                      'q1': arguments['q1'],
                                      'q2': arguments['q2'],
                                      'q3': arguments['q3'],
                                      'q4': arguments['q4'],
                                      'q5': arguments['q5'],
                                      'q6': arguments['q6'],
                                      'q7': arguments['q7'],
                                      'q8': arguments['q8'],
                                    },
                                    {
                                      'o1': o1,
                                      'o2': o2,
                                      'o3': o3,
                                      'o4': o4,
                                      'o5': o5,
                                      'o6': o6,
                                      'o7': o7,
                                      'o8': o8,
                                      'o9': o9,
                                      'o10': o10,
                                    },
                                    user_id,
                                );
                                Navigator.pushNamed(context, kHomeRoute);
                              }
                            }),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

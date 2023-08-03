import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/models/UserModel.dart';
import 'package:sloth/routes/routes.dart';
import 'package:sloth/tools/functions.dart';
import '../../../styles/constants.dart';
import '../../../tools/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  int _selectedCount = 0;

  Type updateSelectedCount(value) {
    if (value == true) {
      _selectedCount++;
    } else {
      _selectedCount--;
    }
    return Null;
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        backgroundColor: kColorCream,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: kNormalHorizontalSpacer,
                  right: kNormalHorizontalSpacer),
              child: Column(
                children: [
                  // Intro text
                  const SizedBox(
                    height: kBigVerticalSpacer,
                  ),
                  Text(
                    AppLocalizations.of(context)!.registerObjectifs__title,
                    style: kBigLabelTextStyle,
                  ),
                  const SizedBox(
                    height: kBigVerticalSpacer,
                  ),
                  Text(
                      AppLocalizations.of(context)!
                          .registerObjectifs__introText1,
                      style: k16BasicTextStyle),
                  const SizedBox(
                    height: kSmallVerticalSpacer,
                  ),
                  _selectedCount < 2
                      ? Text(
                          AppLocalizations.of(context)!
                              .registerObjectifs__introText2,
                          style: k16BasicTextStyle,
                        )
                      : Text(
                          AppLocalizations.of(context)!
                              .registerObjectifs__introText2Valid,
                          style: k16BasicTextStyle,
                        ),
                  const SizedBox(
                    height: kBigVerticalSpacer,
                  ),

                  // Form
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
                                      style: TextStyle(
                                          color: kColorWhite, fontSize: 14))
                                  : const Text('Me sentir plus heureux',
                                      style: TextStyle(
                                          color: kColorGreen, fontSize: 14)),
                              tileColor: o1 ? kColorGreen : kColorWhite,
                              value: o1,
                              checkColor: kColorYellow,
                              activeColor: kColorGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => o1
                                    ? const BorderSide(
                                        width: 1, color: kColorWhite)
                                    : const BorderSide(
                                        width: 1, color: kColorGreen),
                              ),
                              onChanged: (bool? value) {
                                updateSelectedCount(value);
                                setState(() {
                                  _selectedCount;
                                  o1 = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: kMicroVerticalSpacer * 3,
                          ),
                          Material(
                            elevation: 2.0,
                            shadowColor: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10),
                            child: CheckboxListTile(
                              title: o2
                                  ? const Text(
                                      'Avoir une meilleure qualité de vie',
                                      style: TextStyle(
                                          color: kColorWhite, fontSize: 14))
                                  : const Text(
                                      'Avoir une meilleure qualité de vie',
                                      style: TextStyle(
                                          color: kColorGreen, fontSize: 14)),
                              tileColor: o2 ? kColorGreen : kColorWhite,
                              value: o2,
                              checkColor: kColorYellow,
                              activeColor: kColorGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => o2
                                    ? const BorderSide(
                                        width: 1, color: kColorWhite)
                                    : const BorderSide(
                                        width: 1, color: kColorGreen),
                              ),
                              onChanged: (bool? value) {
                                updateSelectedCount(value);
                                setState(() {
                                  _selectedCount;
                                  o2 = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: kMicroVerticalSpacer * 3,
                          ),
                          Material(
                            elevation: 2.0,
                            shadowColor: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10),
                            child: CheckboxListTile(
                              title: o3
                                  ? const Text('Avoir plus d’énergie',
                                      style: TextStyle(
                                          color: kColorWhite, fontSize: 14))
                                  : const Text('Avoir plus d’énergie',
                                      style: TextStyle(
                                          color: kColorGreen, fontSize: 14)),
                              tileColor: o3 ? kColorGreen : kColorWhite,
                              value: o3,
                              checkColor: kColorYellow,
                              activeColor: kColorGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => o3
                                    ? const BorderSide(
                                        width: 1, color: kColorWhite)
                                    : const BorderSide(
                                        width: 1, color: kColorGreen),
                              ),
                              onChanged: (bool? value) {
                                updateSelectedCount(value);
                                setState(() {
                                  _selectedCount;
                                  o3 = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: kMicroVerticalSpacer * 3,
                          ),
                          Material(
                            elevation: 2.0,
                            shadowColor: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10),
                            child: CheckboxListTile(
                              title: o4
                                  ? const Text('Travailler de façon optimal',
                                      style: TextStyle(
                                          color: kColorWhite, fontSize: 14))
                                  : const Text('Travailler de façon optimal',
                                      style: TextStyle(
                                          color: kColorGreen, fontSize: 14)),
                              tileColor: o4 ? kColorGreen : kColorWhite,
                              value: o4,
                              checkColor: kColorYellow,
                              activeColor: kColorGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => o4
                                    ? const BorderSide(
                                        width: 1, color: kColorWhite)
                                    : const BorderSide(
                                        width: 1, color: kColorGreen),
                              ),
                              onChanged: (bool? value) {
                                updateSelectedCount(value);
                                setState(() {
                                  _selectedCount;
                                  o4 = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: kMicroVerticalSpacer * 3,
                          ),
                          Material(
                            elevation: 2.0,
                            shadowColor: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10),
                            child: CheckboxListTile(
                              title: o5
                                  ? const Text('Avoir un meilleur sommeil',
                                      style: TextStyle(
                                          color: kColorWhite, fontSize: 14))
                                  : const Text('Avoir un meilleur sommeil',
                                      style: TextStyle(
                                          color: kColorGreen, fontSize: 14)),
                              tileColor: o5 ? kColorGreen : kColorWhite,
                              value: o5,
                              checkColor: kColorYellow,
                              activeColor: kColorGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => o5
                                    ? const BorderSide(
                                        width: 1, color: kColorWhite)
                                    : const BorderSide(
                                        width: 1, color: kColorGreen),
                              ),
                              onChanged: (bool? value) {
                                updateSelectedCount(value);
                                setState(() {
                                  _selectedCount;
                                  o5 = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: kBigVerticalSpacer,
                          ),
                        ],
                      )),
                  // Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!
                              .registerObjectifs__backButton,
                          style: kSmallLinkGreenText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Button(
                        label: AppLocalizations.of(context)!
                            .registerObjectifs__button,
                        onPressed: () async {
                          if (_registerObjectifsFormKey.currentState != null &&
                              _registerObjectifsFormKey.currentState!
                                  .validate() &&
                              _selectedCount >= 2) {
                            try {
                              if (await checkInternetConnection()) {
                                await _userModel.addUserToFirebaseAuth(
                                    arguments['email'], arguments['password']);
                                final user_id =
                                    FirebaseAuth.instance.currentUser!.uid;
                                await _userModel.addUserToFirestore(
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      elevation: 20,
                                      duration: const Duration(seconds: 15),
                                      backgroundColor: kColorGreen,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(35),
                                              topRight: Radius.circular(35))),
                                      content: Container(
                                          color: kColorGreen,
                                          child: const Column(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    'assets/img/logowhite.png'),
                                              ),
                                              SizedBox(
                                                height: kSmallVerticalSpacer,
                                              ),
                                              Text(
                                                'Bonjour et bienvenue sur Sloth. Vos rapports quotidiens à remplir seront disponibles sur cette page chaque matin pour évaluer la veille. Nous espérons vous aider un maximum.',
                                                style: TextStyle(
                                                    color: kColorWhite,
                                                    fontSize: 16,
                                                    height: 1.5),
                                              ),
                                              SizedBox(
                                                height: kNormalVerticalSpacer,
                                              ),
                                            ],
                                          ))),
                                );
                                Navigator.pushNamed(context, kHomeRoute);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: kColorRed,
                                    content: Text(
                                        'Erreur lors de la création du compte. Vérifiez votre connexion a internet.'),
                                  ),
                                );
                              }
                            } catch (error) {
                              // Gérer les erreurs potentielles ici.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: kColorRed,
                                  content: Text(
                                      'Lala Erreur lors de la création du compte. Vérifiez votre connexion a internet.'),
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kBigVerticalSpacer,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

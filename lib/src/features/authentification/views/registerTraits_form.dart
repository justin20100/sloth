import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';

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

  resetIfChoiceCancel(bool c1,bool c2,bool c3, bool c4, String question){
    if(c1 == false && c2 == false && c3 == false && c4 == false){
      switch (question) {
        case "q1":
          _q1=0;
          break;
        case "q2":
          _q2=0;
          break;
        case "q3":
          _q3=0;
          break;
        case "q4":
          _q4=0;
          break;
        case "q5":
          _q5=0;
          break;
        case "q6":
          _q6=0;
          break;
        case "q7":
          _q7=0;
          break;
        case "q8":
          _q8=0;
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
                      AppLocalizations.of(context)!.registerTraits__title,
                      style: kBigLabelTextStyle,
                    ),
                    const SizedBox(
                      height: kBigVerticalSpacer,
                    ),
                    Text(
                        AppLocalizations.of(context)!.registerTraits__introText1,
                        style: k16BasicTextStyle),
                    const SizedBox(
                      height: kSmallVerticalSpacer,
                    ),
                    Text(
                        AppLocalizations.of(context)!.registerTraits__introText2,
                        style: k16BasicTextStyle),
                    const SizedBox(
                      height: kSmallVerticalSpacer,
                    ),
                    Row(children: [
                      Text(
                        "\u2022",
                        style: k16BasicTextStyle,
                      ), //bullet text
                      SizedBox(
                        width: 10,
                      ), //space between bullet and text
                      Expanded(
                        child: Text(AppLocalizations.of(context)!.registerTraits__option1, style: k16BasicTextStyle), //text
                      )
                    ]),
                    const SizedBox(
                      height: kMicroVerticalSpacer / 2,
                    ),
                    Row(children: [
                      Text(
                        "\u2022",
                        style: k16BasicTextStyle,
                      ), //bullet text
                      SizedBox(
                        width: 10,
                      ), //space between bullet and text
                      Expanded(
                        child: Text(AppLocalizations.of(context)!.registerTraits__option2,
                            style: k16BasicTextStyle), //text
                      )
                    ]),
                    const SizedBox(
                      height: kMicroVerticalSpacer / 2,
                    ),
                    Row(children: [
                      Text(
                        "\u2022",
                        style: k16BasicTextStyle,
                      ), //bullet text
                      SizedBox(
                        width: 10,
                      ), //space between bullet and text
                      Expanded(
                        child: Text(AppLocalizations.of(context)!.registerTraits__option3,
                            style: k16BasicTextStyle), //text
                      )
                    ]),
                    const SizedBox(
                      height: kMicroVerticalSpacer / 2,
                    ),
                    Row(children: [
                      Text(
                        "\u2022",
                        style: k16BasicTextStyle,
                      ), //bullet text
                      SizedBox(
                        width: 10,
                      ), //space between bullet and text
                      Expanded(
                        child: Text(AppLocalizations.of(context)!.registerTraits__option4,
                            style: k16BasicTextStyle), //text
                      )
                    ]),
                    const SizedBox(
                      height: kBigVerticalSpacer,
                    ),

                    // Form
                    Form(
                      key: _registerTraitsFormKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Question 1
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question1,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option1,
                                          style: kCheckboxText, softWrap: true),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => const BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q1c1,
                                            onChanged: (bool? value) {
                                              _q1 = 1;
                                              setState(() {
                                                q1c4 = false;
                                                q1c2 = false;
                                                q1c3 = false;
                                                q1c1 = value!;
                                                resetIfChoiceCancel(q1c1, q1c2, q1c3, q1c4, "q1");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option2,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q1c2,
                                            onChanged: (bool? value) {
                                              _q1 = 2;
                                              setState(() {
                                                q1c1 = false;
                                                q1c4 = false;
                                                q1c3 = false;
                                                q1c2 = value!;
                                                resetIfChoiceCancel(q1c1, q1c2, q1c3, q1c4, "q1");
                                                _q1;
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option3,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q1c3,
                                            onChanged: (bool? value) {
                                              _q1 = 3;
                                              setState(() {
                                                q1c1 = false;
                                                q1c2 = false;
                                                q1c4 = false;
                                                q1c3 = value!;
                                                resetIfChoiceCancel(q1c1, q1c2, q1c3, q1c4, "q1");
                                                _q1;
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option4,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q1c4,
                                            onChanged: (bool? value) {
                                              _q1 = 4;
                                              setState(() {
                                                q1c1 = false;
                                                q1c2 = false;
                                                q1c3 = false;
                                                q1c4 = value!;
                                                resetIfChoiceCancel(q1c1, q1c2, q1c3, q1c4, "q1");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 2
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question2,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option1,
                                          style: kCheckboxText, softWrap: true),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q2c1,
                                            onChanged: (bool? value) {
                                              _q2 = 1;
                                              setState(() {
                                                q2c4 = false;
                                                q2c2 = false;
                                                q2c3 = false;
                                                q2c1 = value!;
                                                resetIfChoiceCancel(q2c1, q2c2, q2c3, q2c4, "q2");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option2,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q2c2,
                                            onChanged: (bool? value) {
                                              _q2 = 2;
                                              setState(() {
                                                q2c1 = false;
                                                q2c4 = false;
                                                q2c3 = false;
                                                q2c2 = value!;
                                                resetIfChoiceCancel(q2c1, q2c2, q2c3, q2c4, "q2");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option3,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q2c3,
                                            onChanged: (bool? value) {
                                              _q2 = 3;
                                              setState(() {
                                                q2c1 = false;
                                                q2c2 = false;
                                                q2c4 = false;
                                                q2c3 = value!;
                                                resetIfChoiceCancel(q2c1, q2c2, q2c3, q2c4, "q2");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option4,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q2c4,
                                            onChanged: (bool? value) {
                                              _q2 = 4;
                                              setState(() {
                                                q2c1 = false;
                                                q2c2 = false;
                                                q2c3 = false;
                                                q2c4 = value!;
                                                resetIfChoiceCancel(q2c1, q2c2, q2c3, q2c4, "q2");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 3
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question3,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option1,
                                          style: kCheckboxText, softWrap: true),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q3c1,
                                            onChanged: (bool? value) {
                                              _q3 = 1;
                                              setState(() {
                                                q3c4 = false;
                                                q3c2 = false;
                                                q3c3 = false;
                                                q3c1 = value!;
                                                resetIfChoiceCancel(q3c1, q3c2, q3c3, q3c4, "q3");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option2,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q3c2,
                                            onChanged: (bool? value) {
                                              _q3 = 2;
                                              setState(() {
                                                q3c1 = false;
                                                q3c4 = false;
                                                q3c3 = false;
                                                q3c2 = value!;
                                                resetIfChoiceCancel(q3c1, q3c2, q3c3, q3c4, "q3");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option3,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q3c3,
                                            onChanged: (bool? value) {
                                              _q3 = 3;
                                              setState(() {
                                                q3c1 = false;
                                                q3c2 = false;
                                                q3c4 = false;
                                                q3c3 = value!;
                                                resetIfChoiceCancel(q3c1, q3c2, q3c3, q3c4, "q3");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option4,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q3c4,
                                            onChanged: (bool? value) {
                                              _q3 = 4;
                                              setState(() {
                                                q3c1 = false;
                                                q3c2 = false;
                                                q3c3 = false;
                                                q3c4 = value!;
                                                resetIfChoiceCancel(q3c1, q3c2, q3c3, q3c4, "q3");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 4
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question4,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option1,
                                          style: kCheckboxText, softWrap: true),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q4c1,
                                            onChanged: (bool? value) {
                                              _q4 = 1;
                                              setState(() {
                                                q4c4 = false;
                                                q4c2 = false;
                                                q4c3 = false;
                                                q4c1 = value!;
                                                resetIfChoiceCancel(q4c1, q4c2, q4c3, q4c4, "q4");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option2,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q4c2,
                                            onChanged: (bool? value) {
                                              _q4 = 2;
                                              setState(() {
                                                q4c1 = false;
                                                q4c4 = false;
                                                q4c3 = false;
                                                q4c2 = value!;
                                                resetIfChoiceCancel(q4c1, q4c2, q4c3, q4c4, "q4");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option3,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q4c3,
                                            onChanged: (bool? value) {
                                              _q4 = 3;
                                              setState(() {
                                                q4c1 = false;
                                                q4c2 = false;
                                                q4c4 = false;
                                                q4c3 = value!;
                                                resetIfChoiceCancel(q4c1, q4c2, q4c3, q4c4, "q4");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option4,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q4c4,
                                            onChanged: (bool? value) {
                                              _q4 = 4;
                                              setState(() {
                                                q4c1 = false;
                                                q4c2 = false;
                                                q4c3 = false;
                                                q4c4 = value!;
                                                resetIfChoiceCancel(q4c1, q4c2, q4c3, q4c4, "q4");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 5
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question5,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option1,
                                          style: kCheckboxText, softWrap: true),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q5c1,
                                            onChanged: (bool? value) {
                                              _q5 = 1;
                                              setState(() {
                                                q5c4 = false;
                                                q5c2 = false;
                                                q5c3 = false;
                                                q5c1 = value!;
                                                resetIfChoiceCancel(q5c1, q5c2, q5c3, q5c4, "q5");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option2,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q5c2,
                                            onChanged: (bool? value) {
                                              _q5 = 2;
                                              setState(() {
                                                q5c1 = false;
                                                q5c4 = false;
                                                q5c3 = false;
                                                q5c2 = value!;
                                                resetIfChoiceCancel(q5c1, q5c2, q5c3, q5c4, "q5");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option3,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q5c3,
                                            onChanged: (bool? value) {
                                              _q5 = 3;
                                              setState(() {
                                                q5c1 = false;
                                                q5c2 = false;
                                                q5c4 = false;
                                                q5c3 = value!;
                                                resetIfChoiceCancel(q5c1, q5c2, q5c3, q5c4, "q5");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option4,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q5c4,
                                            onChanged: (bool? value) {
                                              _q5 = 4;
                                              setState(() {
                                                q5c1 = false;
                                                q5c2 = false;
                                                q5c3 = false;
                                                q5c4 = value!;
                                                resetIfChoiceCancel(q5c1, q5c2, q5c3, q5c4, "q5");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 6
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question6,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option1,
                                          style: kCheckboxText, softWrap: true),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q6c1,
                                            onChanged: (bool? value) {
                                              _q6 = 1;
                                              setState(() {
                                                q6c4 = false;
                                                q6c2 = false;
                                                q6c3 = false;
                                                q6c1 = value!;
                                                resetIfChoiceCancel(q6c1, q6c2, q6c3, q6c4, "q6");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option2,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q6c2,
                                            onChanged: (bool? value) {
                                              _q6 = 2;
                                              setState(() {
                                                q6c1 = false;
                                                q6c4 = false;
                                                q6c3 = false;
                                                q6c2 = value!;
                                                resetIfChoiceCancel(q6c1, q6c2, q6c3, q6c4, "q6");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option3,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q6c3,
                                            onChanged: (bool? value) {
                                              _q6 = 3;
                                              setState(() {
                                                q6c1 = false;
                                                q6c2 = false;
                                                q6c4 = false;
                                                q6c3 = value!;
                                                resetIfChoiceCancel(q6c1, q6c2, q6c3, q6c4, "q6");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option4,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q6c4,
                                            onChanged: (bool? value) {
                                              _q6 = 4;
                                              setState(() {
                                                q6c1 = false;
                                                q6c2 = false;
                                                q6c3 = false;
                                                q6c4 = value!;
                                                resetIfChoiceCancel(q6c1, q6c2, q6c3, q6c4, "q6");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 7
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question7,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option1,
                                          style: kCheckboxText, softWrap: true),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q7c1,
                                            onChanged: (bool? value) {
                                              _q7 = 1;
                                              setState(() {
                                                q7c4 = false;
                                                q7c2 = false;
                                                q7c3 = false;
                                                q7c1 = value!;
                                                resetIfChoiceCancel(q7c1, q7c2, q7c3, q7c4, "q7");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option2,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q7c2,
                                            onChanged: (bool? value) {
                                              _q7 = 2;
                                              setState(() {
                                                q7c1 = false;
                                                q7c4 = false;
                                                q7c3 = false;
                                                q7c2 = value!;
                                                resetIfChoiceCancel(q7c1, q7c2, q7c3, q7c4, "q7");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option3,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q7c3,
                                            onChanged: (bool? value) {
                                              _q7 = 3;
                                              setState(() {
                                                q7c1 = false;
                                                q7c2 = false;
                                                q7c4 = false;
                                                q7c3 = value!;
                                                resetIfChoiceCancel(q7c1, q7c2, q7c3, q7c4, "q7");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option4,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q7c4,
                                            onChanged: (bool? value) {
                                              _q7 = 4;
                                              setState(() {
                                                q7c1 = false;
                                                q7c2 = false;
                                                q7c3 = false;
                                                q7c4 = value!;
                                                resetIfChoiceCancel(q7c1, q7c2, q7c3, q7c4, "q7");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 8
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question8,
                              style: kLabelGreenText,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option1,
                                          style: kCheckboxText, softWrap: true),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q8c1,
                                            onChanged: (bool? value) {
                                              _q8 = 1;
                                              setState(() {
                                                q8c4 = false;
                                                q8c2 = false;
                                                q8c3 = false;
                                                q8c1 = value!;
                                                resetIfChoiceCancel(q8c1, q8c2, q8c3, q8c4, "q8");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option2,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q8c2,
                                            onChanged: (bool? value) {
                                              _q8 = 2;
                                              setState(() {
                                                q8c1 = false;
                                                q8c4 = false;
                                                q8c3 = false;
                                                q8c2 = value!;
                                                resetIfChoiceCancel(q8c1, q8c2, q8c3, q8c4, "q8");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option3,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q8c3,
                                            onChanged: (bool? value) {
                                              _q8 = 3;
                                              setState(() {
                                                q8c1 = false;
                                                q8c2 = false;
                                                q8c4 = false;
                                                q8c3 = value!;
                                                resetIfChoiceCancel(q8c1, q8c2, q8c3, q8c4, "q8");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  height: 90,
                                  padding: const EdgeInsets.only(
                                      left: kSmallHorizontalSpacer,
                                      top: kMicroVerticalSpacer * 2,
                                      right: kSmallHorizontalSpacer),
                                  decoration: kBoxDecoration,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context)!.registerTraits__option4,
                                          style: kCheckboxText,
                                          softWrap: true,
                                          textAlign: TextAlign.center),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                            activeColor: kColorGreen,
                                            checkColor: kColorYellow,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 0.8,
                                                  color: kColorGreen),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: q8c4,
                                            onChanged: (bool? value) {
                                              _q8 = 4;
                                              setState(() {
                                                q8c1 = false;
                                                q8c2 = false;
                                                q8c3 = false;
                                                q8c4 = value!;
                                                resetIfChoiceCancel(q8c1, q8c2, q8c3, q8c4, "q8");
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.registerTraits__backButton,
                            style: kSmallLinkGreenText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Button(
                            label: AppLocalizations.of(context)!.registerTraits__button,
                            onPressed: () {
                              if(
                              _q1!=0 &&
                              _q2!=0 &&
                              _q3!=0 &&
                              _q4!=0 &&
                              _q5!=0 &&
                              _q6!=0 &&
                              _q7!=0 &&
                              _q8!=0
                              ){
                                if (_registerTraitsFormKey.currentState != null &&
                                    _registerTraitsFormKey.currentState!
                                        .validate()) {
                                  Navigator.pushNamed(
                                      context, kRegisterObjectifsRoute,
                                      arguments: {
                                        'email': arguments['email'],
                                        'password': arguments['password'],
                                        'firstname': arguments['firstname'],
                                        'lastname':arguments['lastname'],
                                        'phone':arguments['phone'],
                                        'q1': _q1,
                                        'q2': _q2,
                                        'q3': _q3,
                                        'q4': _q4,
                                        'q5': _q5,
                                        'q6': _q6,
                                        'q7': _q7,
                                        'q8': _q8,
                                      });
                                }
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      duration: Duration(seconds: 15),
                                      backgroundColor: kColorRed,
                                      content: Text("Il semblerait que vous n'avez pas répondu à toutes les questions.",style: TextStyle(color: kColorWhite)),
                                    )
                                );

                              }


                            }),
                      ],
                    ),
                    SizedBox(height: kBigVerticalSpacer,)
                  ],
                )),
          ),
        ));
  }
}

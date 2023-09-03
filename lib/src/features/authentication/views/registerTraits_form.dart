import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/src/features/authentication/controllers/registerTraitsController.dart';
import 'package:sloth/src/features/authentication/views/widgets/registerMoreQuestion_checkboxes.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/utils/functions.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:sloth/src/widgets/error_text.dart';

class RegisterTraitsForm extends StatefulWidget {
  const RegisterTraitsForm({Key? key}) : super(key: key);

  @override
  State<RegisterTraitsForm> createState() => _RegisterTraitsFormState();
}

class _RegisterTraitsFormState extends State<RegisterTraitsForm> {
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

  final Tools tools = Tools();

  final ScrollController _scrollController = ScrollController();

  final TextEditingController pickerWakeUpController = TextEditingController();
  final TextEditingController pickerSleepController = TextEditingController();

  final Q1Controller q1Controller = Q1Controller();
  final Q2Controller q2Controller = Q2Controller();
  final Q3Controller q3Controller = Q3Controller();
  final Q4Controller q4Controller = Q4Controller();
  final Q5Controller q5Controller = Q5Controller();
  final Q6Controller q6Controller = Q6Controller();
  final Q7Controller q7Controller = Q7Controller();
  final Q8Controller q8Controller = Q8Controller();

  final _registerTraitsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> q1FormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> q2FormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> q3FormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> q4FormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> q5FormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> q6FormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> q7FormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> q8FormKey = GlobalKey<FormState>();


  void _scrollToFormField(formKey) {
    final RenderBox renderBox = formKey.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset(0, MediaQuery.of(context).size.height));
    _scrollController.animateTo(offset.dy, duration: const Duration(milliseconds: 700), curve: Curves.easeInOutExpo);
  }

  Future<void> _submitForm() async {
    bool isValid = true;
    setState(() {
      isValid = q1Controller.validate(context, _q1) && isValid;
      isValid = q2Controller.validate(context, _q2) && isValid;
      isValid = q3Controller.validate(context, _q3) && isValid;
      isValid = q4Controller.validate(context, _q4) && isValid;
      isValid = q5Controller.validate(context, _q5) && isValid;
      isValid = q6Controller.validate(context, _q6) && isValid;
      isValid = q7Controller.validate(context, _q7) && isValid;
      isValid = q8Controller.validate(context, _q8) && isValid;
    });
    if (isValid) {
      final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
    } else {
      if (q1Controller.error != null) {
        _scrollToFormField(q1FormKey);
      } else if (q2Controller.error != null) {
        _scrollToFormField(q2FormKey);
      }else if (q3Controller.error != null) {
        _scrollToFormField(q3FormKey);
      }else if (q4Controller.error != null) {
        _scrollToFormField(q4FormKey);
      }else if (q5Controller.error != null) {
        _scrollToFormField(q5FormKey);
      }else if (q6Controller.error != null) {
        _scrollToFormField(q6FormKey);
      }else if (q7Controller.error != null) {
        _scrollToFormField(q7FormKey);
      }else if (q8Controller.error != null) {
        _scrollToFormField(q8FormKey);
      }
    }
  }

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
    return Scaffold(
        backgroundColor: kColorCream,
        body: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
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
                      style: kMegaLabelTextStyle,
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
                            q1Controller.error != null
                                ? ErrorText(text: q1Controller.error!)
                                : const SizedBox(
                              height: 0,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Form(
                              key: q1FormKey,
                                child: RegisterTraitsQuestionCheckboxes(
                                  textOption1: AppLocalizations.of(context)!.registerTraits__option1,
                                  valueOption1: q1c1,
                                  onChangeOption1: (bool? value) {
                                    _q1 = 1;
                                    setState(() {
                                      q1c4 = false;
                                      q1c2 = false;
                                      q1c3 = false;
                                      q1c1 = value!;
                                      resetIfChoiceCancel(q1c1, q1c2, q1c3, q1c4, "q1");
                                    });
                                  },
                                  textOption2: AppLocalizations.of(context)!.registerTraits__option2,
                                  valueOption2: q1c2,
                                  onChangeOption2: (bool? value) {
                                    _q1 = 2;
                                    setState(() {
                                      q1c1 = false;
                                      q1c4 = false;
                                      q1c3 = false;
                                      q1c2 = value!;
                                      resetIfChoiceCancel(q1c1, q1c2, q1c3, q1c4, "q1");
                                      _q1;
                                    });
                                  },
                                  textOption3: AppLocalizations.of(context)!.registerTraits__option3,
                                  valueOption3: q1c3,
                                  onChangeOption3: (bool? value) {
                                    _q1 = 3;
                                    setState(() {
                                      q1c1 = false;
                                      q1c2 = false;
                                      q1c4 = false;
                                      q1c3 = value!;
                                      resetIfChoiceCancel(q1c1, q1c2, q1c3, q1c4, "q1");
                                      _q1;
                                    });
                                  },
                                  textOption4: AppLocalizations.of(context)!.registerTraits__option3,
                                  valueOption4: q1c4,
                                  onChangeOption4: (bool? value) {
                                    _q1 = 4;
                                    setState(() {
                                      q1c1 = false;
                                      q1c2 = false;
                                      q1c3 = false;
                                      q1c4 = value!;
                                      resetIfChoiceCancel(q1c1, q1c2, q1c3, q1c4, "q1");
                                    });
                                  },
                                ),
                            ),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 2
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question2,
                              style: kLabelGreenText,
                            ),
                            q2Controller.error != null
                                ? ErrorText(text: q2Controller.error!)
                                : const SizedBox(
                              height: 0,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Form(
                              key: q2FormKey,
                                child: RegisterTraitsQuestionCheckboxes(
                              textOption1: AppLocalizations.of(context)!.registerTraits__option1,
                              valueOption1: q2c1,
                              onChangeOption1: (bool? value) {
                                _q2 = 1;
                                setState(() {
                                  q2c4 = false;
                                  q2c2 = false;
                                  q2c3 = false;
                                  q2c1 = value!;
                                  resetIfChoiceCancel(q2c1, q2c2, q2c3, q2c4, "q2");
                                });
                              },
                              textOption2: AppLocalizations.of(context)!.registerTraits__option2,
                              valueOption2: q2c2,
                              onChangeOption2: (bool? value) {
                                _q2 = 2;
                                setState(() {
                                  q2c1 = false;
                                  q2c4 = false;
                                  q2c3 = false;
                                  q2c2 = value!;
                                  resetIfChoiceCancel(q2c1, q2c2, q2c3, q2c4, "q2");
                                  _q2;
                                });
                              },
                              textOption3: AppLocalizations.of(context)!.registerTraits__option3,
                              valueOption3: q2c3,
                              onChangeOption3: (bool? value) {
                                _q2= 3;
                                setState(() {
                                  q2c1 = false;
                                  q2c2 = false;
                                  q2c4 = false;
                                  q2c3 = value!;
                                  resetIfChoiceCancel(q2c1, q2c2, q2c3, q2c4, "q2");
                                  _q2;
                                });
                              },
                              textOption4: AppLocalizations.of(context)!.registerTraits__option3,
                              valueOption4: q2c4,
                              onChangeOption4: (bool? value) {
                                _q2 = 4;
                                setState(() {
                                  q2c1 = false;
                                  q2c2 = false;
                                  q2c3 = false;
                                  q2c4 = value!;
                                  resetIfChoiceCancel(q2c1, q2c2, q2c3, q2c4, "q2");
                                });
                              },
                            ),
                            ),

                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 3
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question3,
                              style: kLabelGreenText,
                            ),
                            q3Controller.error != null
                                ? ErrorText(text: q3Controller.error!)
                                : const SizedBox(
                              height: 0,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Form(
                                key: q3FormKey,
                                child: RegisterTraitsQuestionCheckboxes(
                                  textOption1: AppLocalizations.of(context)!.registerTraits__option1,
                                  valueOption1: q3c1,
                                  onChangeOption1: (bool? value) {
                                    _q3 = 1;
                                    setState(() {
                                      q3c4 = false;
                                      q3c2 = false;
                                      q3c3 = false;
                                      q3c1 = value!;
                                      resetIfChoiceCancel(q3c1, q3c2, q3c3, q3c4, "q3");
                                    });
                                  },
                                  textOption2: AppLocalizations.of(context)!.registerTraits__option2,
                                  valueOption2: q3c2,
                                  onChangeOption2: (bool? value) {
                                    _q3 = 2;
                                    setState(() {
                                      q3c1 = false;
                                      q3c4 = false;
                                      q3c3 = false;
                                      q3c2 = value!;
                                      resetIfChoiceCancel(q3c1, q3c2, q3c3, q3c4, "q3");
                                    });
                                  },
                                  textOption3: AppLocalizations.of(context)!.registerTraits__option3,
                                  valueOption3: q3c3,
                                  onChangeOption3: (bool? value) {
                                    _q3 = 3;
                                    setState(() {
                                      q3c1 = false;
                                      q3c2 = false;
                                      q3c4 = false;
                                      q3c3 = value!;
                                      resetIfChoiceCancel(q3c1, q3c2, q3c3, q3c4, "q3");
                                    });
                                  },
                                  textOption4: AppLocalizations.of(context)!.registerTraits__option3,
                                  valueOption4: q3c4,
                                  onChangeOption4: (bool? value) {
                                    _q3 = 4;
                                    setState(() {
                                      q3c1 = false;
                                      q3c2 = false;
                                      q3c3 = false;
                                      q3c4 = value!;
                                      resetIfChoiceCancel(q3c1, q3c2, q3c3, q3c4, "q3");
                                    });
                                  },
                                ),),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 4
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question4,
                              style: kLabelGreenText,
                            ),
                            q4Controller.error != null
                                ? ErrorText(text: q4Controller.error!)
                                : const SizedBox(
                              height: 0,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Form(
                              key: q4FormKey,
                                child: RegisterTraitsQuestionCheckboxes(
                                  textOption1: AppLocalizations.of(context)!.registerTraits__option1,
                                  valueOption1: q4c1,
                                  onChangeOption1: (bool? value) {
                                    _q4 = 1;
                                    setState(() {
                                      q4c4 = false;
                                      q4c2 = false;
                                      q4c3 = false;
                                      q4c1 = value!;
                                      resetIfChoiceCancel(q4c1, q4c2, q4c3, q4c4, "q4");
                                    });
                                  },
                                  textOption2: AppLocalizations.of(context)!.registerTraits__option2,
                                  valueOption2: q4c2,
                                  onChangeOption2: (bool? value) {
                                    _q4 = 2;
                                    setState(() {
                                      q4c1 = false;
                                      q4c4 = false;
                                      q4c3 = false;
                                      q4c2 = value!;
                                      resetIfChoiceCancel(q4c1, q4c2, q4c3, q4c4, "q4");
                                    });
                                  },
                                  textOption3: AppLocalizations.of(context)!.registerTraits__option3,
                                  valueOption3: q4c3,
                                  onChangeOption3: (bool? value) {
                                    _q4 = 3;
                                    setState(() {
                                      q4c1 = false;
                                      q4c2 = false;
                                      q4c4 = false;
                                      q4c3 = value!;
                                      resetIfChoiceCancel(q4c1, q4c2, q4c3, q4c4, "q4");
                                    });
                                  },
                                  textOption4: AppLocalizations.of(context)!.registerTraits__option3,
                                  valueOption4: q4c4,
                                  onChangeOption4: (bool? value) {
                                    _q4 = 4;
                                    setState(() {
                                      q4c1 = false;
                                      q4c2 = false;
                                      q4c3 = false;
                                      q4c4 = value!;
                                      resetIfChoiceCancel(q4c1, q4c2, q4c3, q4c4, "q4");
                                    });
                                  },
                                ),
                            ),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 5
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question5,
                              style: kLabelGreenText,
                            ),
                            q5Controller.error != null
                                ? ErrorText(text: q5Controller.error!)
                                : const SizedBox(
                              height: 0,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Form(
                              key: q5FormKey,
                              child:RegisterTraitsQuestionCheckboxes(
                                textOption1: AppLocalizations.of(context)!.registerTraits__option1,
                                valueOption1: q5c1,
                                onChangeOption1: (bool? value) {
                                  _q5 = 1;
                                  setState(() {
                                    q5c4 = false;
                                    q5c2 = false;
                                    q5c3 = false;
                                    q5c1 = value!;
                                    resetIfChoiceCancel(q5c1, q5c2, q5c3, q5c4, "q5");
                                  });
                                },
                                textOption2: AppLocalizations.of(context)!.registerTraits__option2,
                                valueOption2: q5c2,
                                onChangeOption2: (bool? value) {
                                  _q5 = 2;
                                  setState(() {
                                    q5c1 = false;
                                    q5c4 = false;
                                    q5c3 = false;
                                    q5c2 = value!;
                                    resetIfChoiceCancel(q5c1, q5c2, q5c3, q5c4, "q5");
                                  });
                                },
                                textOption3: AppLocalizations.of(context)!.registerTraits__option3,
                                valueOption3: q5c3,
                                onChangeOption3: (bool? value) {
                                  _q5 = 3;
                                  setState(() {
                                    q5c1 = false;
                                    q5c2 = false;
                                    q5c4 = false;
                                    q5c3 = value!;
                                    resetIfChoiceCancel(q5c1, q5c2, q5c3, q5c4, "q5");
                                  });
                                },
                                textOption4: AppLocalizations.of(context)!.registerTraits__option3,
                                valueOption4: q5c4,
                                onChangeOption4: (bool? value) {
                                  _q5 = 4;
                                  setState(() {
                                    q5c1 = false;
                                    q5c2 = false;
                                    q5c3 = false;
                                    q5c4 = value!;
                                    resetIfChoiceCancel(q5c1, q5c2, q5c3, q5c4, "q5");
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 6
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question6,
                              style: kLabelGreenText,
                            ),
                            q6Controller.error != null
                                ? ErrorText(text: q6Controller.error!)
                                : const SizedBox(
                              height: 0,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Form(
                              key: q6FormKey,
                                child: RegisterTraitsQuestionCheckboxes(
                                  textOption1: AppLocalizations.of(context)!.registerTraits__option1,
                                  valueOption1: q6c1,
                                  onChangeOption1: (bool? value) {
                                    _q6 = 1;
                                    setState(() {
                                      q6c4 = false;
                                      q6c2 = false;
                                      q6c3 = false;
                                      q6c1 = value!;
                                      resetIfChoiceCancel(q6c1, q6c2, q6c3, q6c4, "q6");
                                    });
                                  },
                                  textOption2: AppLocalizations.of(context)!.registerTraits__option2,
                                  valueOption2: q6c2,
                                  onChangeOption2: (bool? value) {
                                    _q6 = 2;
                                    setState(() {
                                      q6c1 = false;
                                      q6c4 = false;
                                      q6c3 = false;
                                      q6c2 = value!;
                                      resetIfChoiceCancel(q6c1, q6c2, q6c3, q6c4, "q6");
                                    });
                                  },
                                  textOption3: AppLocalizations.of(context)!.registerTraits__option3,
                                  valueOption3: q6c3,
                                  onChangeOption3: (bool? value) {
                                    _q6 = 3;
                                    setState(() {
                                      q6c1 = false;
                                      q6c2 = false;
                                      q6c4 = false;
                                      q6c3 = value!;
                                      resetIfChoiceCancel(q6c1, q6c2, q6c3, q6c4, "q6");
                                    });
                                  },
                                  textOption4: AppLocalizations.of(context)!.registerTraits__option3,
                                  valueOption4: q6c4,
                                  onChangeOption4: (bool? value) {
                                    _q6 = 4;
                                    setState(() {
                                      q6c1 = false;
                                      q6c2 = false;
                                      q6c3 = false;
                                      q6c4 = value!;
                                      resetIfChoiceCancel(q6c1, q6c2, q6c3, q6c4, "q6");
                                    });
                                  },
                                ),
                            ),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 7
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question7,
                              style: kLabelGreenText,
                            ),
                            q7Controller.error != null
                                ? ErrorText(text: q7Controller.error!)
                                : const SizedBox(
                              height: 0,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Form(
                              key: q7FormKey,
                                child: RegisterTraitsQuestionCheckboxes(
                                  textOption1: AppLocalizations.of(context)!.registerTraits__option1,
                                  valueOption1: q7c1,
                                  onChangeOption1: (bool? value) {
                                    _q7 = 1;
                                    setState(() {
                                      q7c4 = false;
                                      q7c2 = false;
                                      q7c3 = false;
                                      q7c1 = value!;
                                      resetIfChoiceCancel(q7c1, q7c2, q7c3, q7c4, "q7");
                                    });
                                  },
                                  textOption2: AppLocalizations.of(context)!.registerTraits__option2,
                                  valueOption2: q7c2,
                                  onChangeOption2: (bool? value) {
                                    _q7 = 2;
                                    setState(() {
                                      q7c1 = false;
                                      q7c4 = false;
                                      q7c3 = false;
                                      q7c2 = value!;
                                      resetIfChoiceCancel(q7c1, q7c2, q7c3, q7c4, "q7");
                                    });
                                  },
                                  textOption3: AppLocalizations.of(context)!.registerTraits__option3,
                                  valueOption3: q7c3,
                                  onChangeOption3: (bool? value) {
                                    _q7 = 3;
                                    setState(() {
                                      q7c1 = false;
                                      q7c2 = false;
                                      q7c4 = false;
                                      q7c3 = value!;
                                      resetIfChoiceCancel(q7c1, q7c2, q7c3, q7c4, "q7");
                                    });
                                  },
                                  textOption4: AppLocalizations.of(context)!.registerTraits__option3,
                                  valueOption4: q7c4,
                                  onChangeOption4: (bool? value) {
                                    _q7 = 4;
                                    setState(() {
                                      q7c1 = false;
                                      q7c2 = false;
                                      q7c3 = false;
                                      q7c4 = value!;
                                      resetIfChoiceCancel(q7c1, q7c2, q7c3, q7c4, "q7");
                                    });
                                  },
                                ),
                            ),
                            const SizedBox(
                              height: kBigVerticalSpacer,
                            ),

                            // Question 8
                            Text(
                              AppLocalizations.of(context)!.registerTraits__question8,
                              style: kLabelGreenText,
                            ),
                            q8Controller.error != null
                                ? ErrorText(text: q8Controller.error!)
                                : const SizedBox(
                              height: 0,
                            ),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            Form(
                              key: q8FormKey,
                                child: RegisterTraitsQuestionCheckboxes(
                                  textOption1: AppLocalizations.of(context)!.registerTraits__option1,
                                  valueOption1: q8c1,
                                  onChangeOption1: (bool? value) {
                                    _q8 = 1;
                                    setState(() {
                                      q8c4 = false;
                                      q8c2 = false;
                                      q8c3 = false;
                                      q8c1 = value!;
                                      resetIfChoiceCancel(q8c1, q8c2, q8c3, q8c4, "q8");
                                    });
                                  },
                                  textOption2: AppLocalizations.of(context)!.registerTraits__option2,
                                  valueOption2: q8c2,
                                  onChangeOption2: (bool? value) {
                                    _q8 = 2;
                                    setState(() {
                                      q8c1 = false;
                                      q8c4 = false;
                                      q8c3 = false;
                                      q8c2 = value!;
                                      resetIfChoiceCancel(q8c1, q8c2, q8c3, q8c4, "q8");
                                    });
                                  },
                                  textOption3: AppLocalizations.of(context)!.registerTraits__option3,
                                  valueOption3: q8c3,
                                  onChangeOption3: (bool? value) {
                                    _q8 = 3;
                                    setState(() {
                                      q8c1 = false;
                                      q8c2 = false;
                                      q8c4 = false;
                                      q8c3 = value!;
                                      resetIfChoiceCancel(q8c1, q8c2, q8c3, q8c4, "q8");
                                    });
                                  },
                                  textOption4: AppLocalizations.of(context)!.registerTraits__option3,
                                  valueOption4: q8c4,
                                  onChangeOption4: (bool? value) {
                                    _q8 = 4;
                                    setState(() {
                                      q8c1 = false;
                                      q8c2 = false;
                                      q8c3 = false;
                                      q8c4 = value!;
                                      resetIfChoiceCancel(q8c1, q8c2, q8c3, q8c4, "q8");
                                    });
                                  },
                                ),
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
                            onPressed: () {_submitForm();}),
                      ],
                    ),
                    const SizedBox(height: kBigVerticalSpacer,)
                  ],
                )),
          ),
        ));
  }
}

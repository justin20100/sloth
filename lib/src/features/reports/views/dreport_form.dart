import 'package:flutter/material.dart';
import 'package:sloth/src/features/reports/controllers/DReportControllers.dart';
import 'package:sloth/src/features/reports/models/DReportModel.dart';
import 'package:sloth/src/features/reports/views/widgets/selectList_input.dart';
import 'package:sloth/src/features/reports/views/widgets/slider_input.dart';
import 'package:sloth/src/features/reports/views/widgets/timePicker_input.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/utils/functions.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:sloth/src/widgets/error_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class DReportForm extends StatefulWidget {
  const DReportForm({Key? key}) : super(key: key);

  @override
  State<DReportForm> createState() => _DReportFormState();
}

class _DReportFormState extends State<DReportForm> {
  final Tools tools = Tools();

  final ScrollController _scrollController = ScrollController();

  final TextEditingController pickerWakeUpController = TextEditingController();
  final TextEditingController pickerSleepController = TextEditingController();

  final WakeUpInputController wakeUpController = WakeUpInputController();
  final SleepInputController sleepController = SleepInputController();
  final FeelingLevelSelectController feelingLevelController = FeelingLevelSelectController();
  final FormDoneCheckboxController checkFormDoneController = FormDoneCheckboxController();

  final DReportModel dReportModel = DReportModel();

  final GlobalKey _globalKey = GlobalKey();
  final GlobalKey<FormState> wakeUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> sleepFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> feelingLevelFormKey = GlobalKey<FormState>();

  late double _sleepevaluation = 50.0;
  late double _cognitiveevaluation = 50.0;
  late double _physiqueevaluation = 50.0;
  late String? _moreinfos = '';
  late double _motivation = 50.0;
  late double _euphoria = 50.0;
  late double _state = 50.0;
  late double _mood = 50.0;
  late double _stress = 50.0;
  late double _anxiety = 50.0;
  late DateTime _sleep;
  late DateTime _wakeup;
  String? _fellingLevel;
  bool _checkformdone = false;
  List<String> feelingLevelList = [
    'Extrêmement éveillé : 1',
    'Très éveillé : 2',
    'Eveillé : 3',
    'Plutôt éveillé : 4',
    'Ni éveillé, ni somnolent : 5',
    'Quelques signes de somnolence : 6',
    'Somnolent, mais sans effort pour rester eveillé : 7',
    'Somnolent, mais quelques efforts pour rester éveillé : 8',
    'Très somnolent, grand effort pour rester éveillé, combat l’endormissement : 9',
    'Extrêmement somnolent, ne peut pas rester éveillé : 10',
  ];

  void _scrollToFormField(formKey) {
    final RenderBox renderBox = formKey.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset(0, MediaQuery.of(context).size.height));
    print(offset);
    _scrollController.animateTo(offset.dy, duration: const Duration(milliseconds: 700), curve: Curves.easeInOutExpo);
  }

  Future<void> _onWakeUpChange(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingScaleUp(),
          child: Theme(
            data: ThemeData(
              timePickerTheme: TimePickerThemeData(
                  backgroundColor: kColorCream,
                  hourMinuteColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? kColorYellow : kColorGreen),
                  hourMinuteTextColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? kColorGreen : kColorCream),
                  dialHandColor: kColorGreen,
                  dialBackgroundColor: kColorYellow,
                  dialTextColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? kColorYellow : kColorCream),
                  entryModeIconColor: kColorGreen),
              textTheme: const TextTheme(
                labelSmall: TextStyle(
                  color: kColorGreen,
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                  style: ButtonStyle(
                foregroundColor: MaterialStateColor.resolveWith((states) => kColorGreen),
                overlayColor: MaterialStateColor.resolveWith((states) => kColorGreen),
              )),
            ),
            child: child!,
          ),
        );
      },
    );

    if (pickedTime != null) {
      String formattedTime = pickedTime.format(context);
      setState(() {
        pickerWakeUpController.text = formattedTime;
        _wakeup = DateTime(kToday.year, kToday.month, kToday.day - 1, pickedTime.hour, pickedTime.minute);
      });
    }
  }

  Future<void> _onSleepChange(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingScaleUp(),
          child: Theme(
            data: ThemeData(
              timePickerTheme: TimePickerThemeData(
                  backgroundColor: kColorCream,
                  hourMinuteColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? kColorYellow : kColorGreen),
                  hourMinuteTextColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? kColorGreen : kColorCream),
                  dialHandColor: kColorGreen,
                  dialBackgroundColor: kColorYellow,
                  dialTextColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? kColorYellow : kColorCream),
                  entryModeIconColor: kColorGreen),
              textTheme: const TextTheme(
                labelSmall: TextStyle(
                  color: kColorGreen,
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                  style: ButtonStyle(
                foregroundColor: MaterialStateColor.resolveWith((states) => kColorGreen),
                overlayColor: MaterialStateColor.resolveWith((states) => kColorGreen),
              )),
            ),
            child: child!,
          ),
        );
      },
    );

    if (pickedTime != null) {
      String formattedTime = pickedTime.format(context);
      setState(() {
        pickerSleepController.text = formattedTime;
        _sleep = DateTime(kToday.year, kToday.month, kToday.day - 1, pickedTime.hour, pickedTime.minute);
      });
    }
  }

  Future<void> _submitForm() async {
    bool isValid = true;
    setState(() {
      isValid = wakeUpController.validate(context, pickerWakeUpController.text) && isValid;
      isValid = sleepController.validate(context, pickerSleepController.text) && isValid;
      isValid = feelingLevelController.validate(context, _fellingLevel) && isValid;
      isValid = checkFormDoneController.validate(context, _checkformdone) && isValid;
    });
    if (isValid) {
      String userId = await tools.getUserID();
      await dReportModel.createDReport(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1).toUtc(), _anxiety, _cognitiveevaluation, _euphoria, _mood, _moreinfos!, _motivation, _physiqueevaluation, _sleep, _sleepevaluation, _state, _stress, _wakeup, userId);
      Navigator.pushNamed(context, kHomeRoute);
    } else {
      if (wakeUpController.error != null) {
        _scrollToFormField(wakeUpFormKey);
      } else if (sleepController.error != null) {
        _scrollToFormField(sleepFormKey);
      } else if (feelingLevelController.error != null) {
        _scrollToFormField(feelingLevelFormKey);
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: kColorCream,
      appBar: AppBar(
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        toolbarHeight: 80,
        backgroundColor: kColorCream,
        leading: WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(curve: Curves.easeOutCirc, duration: const Duration(milliseconds: 700)),
          child: GestureDetector(
            onTap: () => {Navigator.popAndPushNamed(context, kHomeRoute)},
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kColorGreen,
            ),
          ),
        ),
        title: WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(curve: Curves.easeOutCirc, duration: const Duration(milliseconds: 700)),
            child: Column(
              children: [
                Text(
                  getTheDate(context),
                  style: kAppBarTextStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  AppLocalizations.of(context)!.dReport__title,
                  style: const TextStyle(fontSize: 12, color: kColorGreen, fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(left: kNormalHorizontalSpacer, right: kNormalHorizontalSpacer),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kNormalVerticalSpacer),
              //Text intro
              Text(
                AppLocalizations.of(context)!.dReport__inText,
                style: k16BasicTextStyle,
              ),

              // Wake up
              const SizedBox(height: kNormalVerticalSpacer),
              Text(
                AppLocalizations.of(context)!.dReport__wakeUpLabel,
                style: kLabelGreenText,
              ),
              const SizedBox(
                height: kSmallHorizontalSpacer,
              ),
              Form(
                key: wakeUpFormKey,
                child: TimePickerInput(
                  controller: pickerWakeUpController,
                  onChange: () => {_onWakeUpChange(context)},
                ),
              ),
              wakeUpController.error != null
                  ? ErrorText(text: wakeUpController.error!)
                  : const SizedBox(
                      height: 0,
                    ),

              // Sleep
              const SizedBox(
                height: kBigVerticalSpacer,
              ),
              Text(
                AppLocalizations.of(context)!.dReport__sleepLabel,
                style: kLabelGreenText,
              ),
              const SizedBox(
                height: kSmallHorizontalSpacer,
              ),
              Form(
                key: sleepFormKey,
                child: TimePickerInput(
                  controller: pickerSleepController,
                  onChange: () => {_onSleepChange(context)},
                ),
              ),
              sleepController.error != null
                  ? ErrorText(
                      text: sleepController.error!,
                    )
                  : const SizedBox(
                      height: 0,
                    ),

              // Sleep evaluation
              const SizedBox(
                height: kBigVerticalSpacer,
              ),
              Text(
                AppLocalizations.of(context)!.dReport__sleepEvaluationLabel,
                style: kLabelGreenText,
              ),
              const SizedBox(
                height: kSmallHorizontalSpacer,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.dReport__sleepEvaluationLeftChoice),
                  Text(AppLocalizations.of(context)!.dReport__sleepEvaluationRightChoice),
                ],
              ),
              const SizedBox(
                height: kMicroVerticalSpacer,
              ),
              Slider_input(
                value: _sleepevaluation,
                onChanged: (double value) {
                  setState(() {
                    _sleepevaluation = double.parse(value.toStringAsFixed(2));
                  });
                },
              ),

              // Niveau de fatigue cognitive
              const SizedBox(
                height: kBigVerticalSpacer,
              ),
              Text(
                AppLocalizations.of(context)!.dReport__cognitiveEvaluationLabel,
                style: kLabelGreenText,
              ),
              const SizedBox(
                height: kSmallHorizontalSpacer,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.dReport__cognitiveEvaluationLeftChoice),
                  Text(AppLocalizations.of(context)!.dReport__cognitiveEvaluationRightChoice),
                ],
              ),
              const SizedBox(
                height: kMicroVerticalSpacer,
              ),
              Slider_input(
                value: _cognitiveevaluation,
                onChanged: (double value) {
                  setState(() {
                    _cognitiveevaluation = double.parse(value.toStringAsFixed(2));
                  });
                },
              ),

              // Niveau de fatigue physique
              const SizedBox(
                height: kBigVerticalSpacer,
              ),
              Text(
                AppLocalizations.of(context)!.dReport__physiqueEvaluationLabel,
                style: kLabelGreenText,
              ),
              const SizedBox(
                height: kSmallHorizontalSpacer,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.dReport__physiqueEvaluationLeftChoice),
                  Text(AppLocalizations.of(context)!.dReport__physiqueEvaluationRightChoice),
                ],
              ),
              const SizedBox(
                height: kMicroVerticalSpacer,
              ),
              Slider_input(
                value: _physiqueevaluation,
                onChanged: (double value) {
                  setState(() {
                    _physiqueevaluation = double.parse(value.toStringAsFixed(2));
                  });
                },
              ),

              // More infos
              const SizedBox(
                height: kBigVerticalSpacer,
              ),
              Text(
                AppLocalizations.of(context)!.dReport__moreInfosLabel,
                style: kLabelGreenText,
              ),
              const SizedBox(
                height: kSmallHorizontalSpacer,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.multiline,
                onChanged: (value) => {_moreinfos = value},
                maxLines: 5,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(kSmallVerticalSpacer),
                  hintText: AppLocalizations.of(context)!.dReport__moreInfosHintText,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kColorGreen,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  focusColor: kColorYellow,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: kColorYellow,
                  )),
                  errorStyle: const TextStyle(),
                  fillColor: kColorWhite,
                  filled: true,
                ),
              ),
              const SizedBox(
                height: kBigVerticalSpacer,
              ),

              // En generale
              Text(
                AppLocalizations.of(context)!.dReport__inGeneralLabel,
                style: kLabelGreenText,
              ),
              // Motivation
              const SizedBox(
                height: kNormalVerticalSpacer,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.dReport__motivationLeftChoice),
                  Text(AppLocalizations.of(context)!.dReport__motivationRightChoice),
                ],
              ),
              const SizedBox(
                height: kMicroVerticalSpacer,
              ),
              Slider_input(
                value: _motivation,
                onChanged: (double value) {
                  setState(() {
                    _motivation = double.parse(value.toStringAsFixed(2));
                  });
                },
              ),

              // Euphoria
              const SizedBox(
                height: kNormalVerticalSpacer,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.dReport__euphoriaLeftChoice),
                  Text(AppLocalizations.of(context)!.dReport__euphoriaRightChoice),
                ],
              ),
              const SizedBox(
                height: kMicroVerticalSpacer,
              ),
              Slider_input(
                value: _euphoria,
                onChanged: (double value) {
                  setState(() {
                    _euphoria = double.parse(value.toStringAsFixed(2));
                  });
                },
              ),
              // State
              const SizedBox(
                height: kNormalVerticalSpacer,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.dReport__stateLeftChoice),
                  Text(AppLocalizations.of(context)!.dReport__stateRightChoice),
                ],
              ),
              const SizedBox(
                height: kMicroVerticalSpacer,
              ),
              Slider_input(
                value: _state,
                onChanged: (double value) {
                  setState(() {
                    _state = double.parse(value.toStringAsFixed(2));
                  });
                },
              ),
              // Mood
              const SizedBox(
                height: kNormalVerticalSpacer,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.dReport__moodLeftChoice),
                  Text(AppLocalizations.of(context)!.dReport__moodRightChoice),
                ],
              ),
              const SizedBox(
                height: kMicroVerticalSpacer,
              ),
              Slider_input(
                value: _mood,
                onChanged: (double value) {
                  setState(() {
                    _mood = double.parse(value.toStringAsFixed(2));
                  });
                },
              ),
              // Stress
              const SizedBox(
                height: kNormalVerticalSpacer,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.dReport__stressLeftChoice),
                  Text(AppLocalizations.of(context)!.dReport__stressRightChoice),
                ],
              ),
              const SizedBox(
                height: kMicroVerticalSpacer,
              ),
              Slider_input(
                value: _stress,
                onChanged: (double value) {
                  setState(() {
                    _stress = double.parse(value.toStringAsFixed(2));
                  });
                },
              ),
              // Anxiety
              const SizedBox(
                height: kNormalVerticalSpacer,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.dReport__anxietyLeftChoice),
                  Text(AppLocalizations.of(context)!.dReport__anxietyRightChoice),
                ],
              ),
              const SizedBox(
                height: kMicroVerticalSpacer,
              ),
              Slider_input(
                value: _anxiety,
                onChanged: (double value) {
                  setState(() {
                    _anxiety = double.parse(value.toStringAsFixed(2));
                  });
                },
              ),

              // Feeling Level
              const SizedBox(
                height: kBigVerticalSpacer,
              ),
              Text(
                AppLocalizations.of(context)!.dReport__feelingLevelLabel,
                style: kLabelGreenText,
              ),
              const SizedBox(
                height: kSmallHorizontalSpacer,
              ),
              Form(
                key: feelingLevelFormKey,
                child: SelectListInput(
                  onChanged: (String? value) {
                    setState(() {
                      _fellingLevel = value!;
                    });
                  },
                  value: _fellingLevel,
                  list: feelingLevelList,
                  hintText: AppLocalizations.of(context)!.dReport__feelingLevelLabel,
                ),
              ),
              feelingLevelController.error != null
                  ? ErrorText(
                      text: feelingLevelController.error!,
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              // check form done
              const SizedBox(
                height: kBigVerticalSpacer,
              ),
              Row(
                children: [
                  FormField<bool>(
                    builder: (FormFieldState<bool> field) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            activeColor: kColorGreen,
                            checkColor: kColorYellow,
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                width: 1.4,
                                color: checkFormDoneController.error ? kColorRed : kColorGreen,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            value: _checkformdone,
                            onChanged: (value) {
                              setState(() {
                                _checkformdone = value!;
                                field.didChange(value);
                              });
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  Expanded(
                      child: Text(
                    AppLocalizations.of(context)!.dReport__checkFormDoneLabel,
                    style: kLabelGreenText,
                  ))
                ],
              ),

              // Button
              const SizedBox(
                height: kBigVerticalSpacer,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Button(
                    label: 'Enregistrer',
                    onPressed: () {
                      _submitForm();
                    }),
              ),
              const SizedBox(
                height: kNormalVerticalSpacer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

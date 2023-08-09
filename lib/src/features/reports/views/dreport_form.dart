import 'package:flutter/material.dart';
import 'package:sloth/src/features/reports/controllers/DReportControllers.dart';
import 'package:sloth/src/features/reports/models/DReportModel.dart';
import 'package:sloth/src/features/reports/views/widgets/selectList_input.dart';
import 'package:sloth/src/features/reports/views/widgets/timePicker_input.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/utils/functions.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:sloth/src/widgets/textError.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DReportForm extends StatefulWidget {
  const DReportForm({Key? key}) : super(key: key);

  @override
  State<DReportForm> createState() => _DReportFormState();
}

class _DReportFormState extends State<DReportForm> {
  final ScrollController _scrollController = ScrollController();

  final TextEditingController pickerWakeUpController = TextEditingController();
  final TextEditingController pickerSleepController = TextEditingController();

  final WakeUpController wakeUpController = WakeUpController();
  final SleepController sleepController = SleepController();
  final FeelingLevelController feelingLevelController = FeelingLevelController();
  final CheckFormDoneController checkFormDoneController = CheckFormDoneController();

  final DReportModel dReportModel = DReportModel();

  final GlobalKey<FormState> wakeUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> sleepFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> feelingLevelFormKey = GlobalKey<FormState>();

  late double _sleepevaluation = 2.5;
  late double _cognitiveevaluation = 2.5;
  late double _physiqueevaluation = 2.5;
  late String? _moreinfos = '';
  late double _motivation = 2.5;
  late double _euphoria = 2.5;
  late double _state = 2.5;
  late double _mood = 2.5;
  late double _stress = 2.5;
  late double _anxiety = 2.5;
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

  Future<void> _submitForm() async {
    bool isValid = true;
    setState(() {
      isValid =
          wakeUpController.validate(context, pickerWakeUpController.text) &&
              isValid;
      isValid = sleepController.validate(context, pickerSleepController.text) &&
          isValid;
      isValid =
          feelingLevelController.validate(context, _fellingLevel) && isValid;
      isValid =
          checkFormDoneController.validate(context, _checkformdone) && isValid;
    });

    if (isValid) {
      String userId = await getUserID();
      dReportModel.createDReport(
          kToday,
          _anxiety,
          _cognitiveevaluation,
          _euphoria,
          _mood,
          _moreinfos!,
          _motivation,
          _physiqueevaluation,
          _sleep,
          _sleepevaluation,
          _state,
          _stress,
          _wakeup,
          userId);
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

  void _scrollToFormField(formKey) {
    final RenderBox renderBox = formKey.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(const Offset(0,1000));
    _scrollController.animateTo(offset.dy, duration: const Duration(milliseconds: 700), curve: Curves.easeInOutExpo);
  }

  Future<void> _onWakeUpChange(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      _wakeup = DateTime(kToday.year, kToday.month, kToday.day - 1,
          pickedTime.hour, pickedTime.minute);
      String formattedTime = pickedTime.format(context);
      setState(() {
        pickerWakeUpController.text = formattedTime;
        _wakeup;
      });
    }
  }

  Future<void> _onSleepChange(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      _sleep = DateTime(kToday.year, kToday.month, kToday.day - 1,
          pickedTime.hour, pickedTime.minute);
      String formattedTime = pickedTime.format(context);
      setState(() {
        pickerSleepController.text = formattedTime;
        _sleep;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            leading: GestureDetector(
              onTap: () => {Navigator.pop(context)},
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: kColorGreen,
              ),
            ),
            title: Column(
              children: [
                Text(
                  getTheDateNM(),
                  style: kAppBarTextStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Rapport quotidien',
                  style: TextStyle(
                      fontSize: 12,
                      color: kColorGreen,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(
                left: kNormalHorizontalSpacer, right: kNormalHorizontalSpacer),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kNormalVerticalSpacer),
                //Text intro
                const Text(
                  "Comme chaque jour ce formulaire représente votre ressenti sur votre journée d'hier. Remplissez ce rapport avec précaution.",
                  style: k16BasicTextStyle,
                ),
                const SizedBox(height: kNormalVerticalSpacer),
                const Text(
                  "Heure de lever",
                  style: kLabelGreenText,
                ),
                const SizedBox(
                  height: kSmallHorizontalSpacer,
                ),
                Form(
                  key: wakeUpFormKey,
                  child: TimePickerInput(
                    controller: pickerWakeUpController,
                  ),
                ),

                wakeUpController.error != null
                    ? TextError(text: wakeUpController.error!)
                    : const SizedBox(
                        height: 0,
                      ),

                // Sleep
                const SizedBox(
                  height: kBigVerticalSpacer,
                ),
                const Text(
                  "Heure de couché",
                  style: kLabelGreenText,
                ),
                const SizedBox(
                  height: kSmallHorizontalSpacer,
                ),
                Form(
                  key: sleepFormKey,
                  child: TimePickerInput(controller: pickerSleepController),
                ),

                sleepController.error != null
                    ? TextError(
                        text: sleepController.error!,
                      )
                    : const SizedBox(
                        height: 0,
                      ),

                // Sleep evaluation
                const SizedBox(
                  height: kBigVerticalSpacer,
                ),
                const Text(
                  "Comment évaluriez-vous votre sommeil ?",
                  style: kLabelGreenText,
                ),
                const SizedBox(
                  height: kSmallHorizontalSpacer,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Mauvais'),
                    Text('Très bon'),
                  ],
                ),
                const SizedBox(
                  height: kMicroVerticalSpacer,
                ),
                SliderTheme(
                  data: SliderThemeData(
                    thumbColor: kColorGreen,
                    activeTrackColor: kColorGreen,
                    inactiveTrackColor: kColorYellow,
                    overlayColor: Colors.blue.withOpacity(0.3),
                    trackHeight: 6.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12.0,
                      elevation: 1.0,
                      pressedElevation: 0,
                    ),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 0.0),
                    inactiveTickMarkColor: Colors.transparent,
                    activeTickMarkColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: _sleepevaluation,
                    min: 0.0,
                    max: 5.0,
                    divisions: 10,
                    onChanged: (double value) {
                      setState(() {
                        _sleepevaluation = value;
                      });
                    },
                  ),
                ),

                // Niveau de fatigue cognitive
                const SizedBox(
                  height: kBigVerticalSpacer,
                ),
                const Text(
                  "Comment évaluriez-vous votre niveau de fatigue cognitive",
                  style: kLabelGreenText,
                ),
                const SizedBox(
                  height: kSmallHorizontalSpacer,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Faible'),
                    Text('Èlevé'),
                  ],
                ),
                const SizedBox(
                  height: kMicroVerticalSpacer,
                ),
                SliderTheme(
                  data: SliderThemeData(
                    thumbColor: kColorGreen,
                    activeTrackColor: kColorGreen,
                    inactiveTrackColor: kColorYellow,
                    overlayColor: Colors.blue.withOpacity(0.3),
                    trackHeight: 6.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12.0,
                      elevation: 1.0,
                      pressedElevation: 0,
                    ),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 0.0),
                    inactiveTickMarkColor: Colors.transparent,
                    activeTickMarkColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: _cognitiveevaluation,
                    min: 0.0,
                    max: 5.0,
                    divisions: 10,
                    onChanged: (double value) {
                      setState(() {
                        _cognitiveevaluation = value;
                      });
                    },
                  ),
                ),

                // Niveau de fatigue physique
                const SizedBox(
                  height: kBigVerticalSpacer,
                ),
                const Text(
                  "Comment évaluriez-vous votre niveau de fatigue physique",
                  style: kLabelGreenText,
                ),
                const SizedBox(
                  height: kSmallHorizontalSpacer,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Faible'),
                    Text('Èlevé'),
                  ],
                ),
                const SizedBox(
                  height: kMicroVerticalSpacer,
                ),
                SliderTheme(
                  data: SliderThemeData(
                    thumbColor: kColorGreen,
                    activeTrackColor: kColorGreen,
                    inactiveTrackColor: kColorYellow,
                    overlayColor: Colors.blue.withOpacity(0.3),
                    trackHeight: 6.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12.0,
                      elevation: 1.0,
                      pressedElevation: 0,
                    ),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 0.0),
                    inactiveTickMarkColor: Colors.transparent,
                    activeTickMarkColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: _physiqueevaluation,
                    min: 0.0,
                    max: 5.0,
                    divisions: 10,
                    onChanged: (double value) {
                      setState(() {
                        _physiqueevaluation = value;
                      });
                    },
                  ),
                ),

                // More infos
                const SizedBox(
                  height: kBigVerticalSpacer,
                ),
                const Text(
                  "Autres informations (sieste, activité spéciale, consommation d'alcool ou de boisson énergisante,...) ",
                  style: kLabelGreenText,
                ),
                const SizedBox(
                  height: kSmallHorizontalSpacer,
                ),
                TextField(
                  onChanged: (value) => {_moreinfos = value},
                  maxLines: 5,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(kSmallVerticalSpacer),
                    hintText: 'Exemple : une sieste de 20 minute a 14h.',
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
                const Text(
                  "De manière générale",
                  style: kLabelGreenText,
                ),
                // Motivation
                const SizedBox(
                  height: kNormalVerticalSpacer,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Démotivé'),
                    Text('Motivé'),
                  ],
                ),
                const SizedBox(
                  height: kMicroVerticalSpacer,
                ),
                SliderTheme(
                  data: SliderThemeData(
                    thumbColor: kColorGreen,
                    activeTrackColor: kColorGreen,
                    inactiveTrackColor: kColorYellow,
                    overlayColor: Colors.blue.withOpacity(0.3),
                    trackHeight: 6.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12.0,
                      elevation: 1.0,
                      pressedElevation: 0,
                    ),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 0.0),
                    inactiveTickMarkColor: Colors.transparent,
                    activeTickMarkColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: _motivation,
                    min: 0.0,
                    max: 5.0,
                    divisions: 10,
                    onChanged: (double value) {
                      setState(() {
                        _motivation = value;
                      });
                    },
                  ),
                ),
                // Euphoria
                const SizedBox(
                  height: kNormalVerticalSpacer,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Déprimé'),
                    Text('Euphorique'),
                  ],
                ),
                const SizedBox(
                  height: kMicroVerticalSpacer,
                ),
                SliderTheme(
                  data: SliderThemeData(
                    thumbColor: kColorGreen,
                    activeTrackColor: kColorGreen,
                    inactiveTrackColor: kColorYellow,
                    overlayColor: Colors.blue.withOpacity(0.3),
                    trackHeight: 6.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12.0,
                      elevation: 1.0,
                      pressedElevation: 0,
                    ),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 0.0),
                    inactiveTickMarkColor: Colors.transparent,
                    activeTickMarkColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: _euphoria,
                    min: 0.0,
                    max: 5.0,
                    divisions: 10,
                    onChanged: (double value) {
                      setState(() {
                        _euphoria = value;
                      });
                    },
                  ),
                ),
                // State
                const SizedBox(
                  height: kNormalVerticalSpacer,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Èpuisé'),
                    Text('Frais'),
                  ],
                ),
                const SizedBox(
                  height: kMicroVerticalSpacer,
                ),
                SliderTheme(
                  data: SliderThemeData(
                    thumbColor: kColorGreen,
                    activeTrackColor: kColorGreen,
                    inactiveTrackColor: kColorYellow,
                    overlayColor: Colors.blue.withOpacity(0.3),
                    trackHeight: 6.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12.0,
                      elevation: 1.0,
                      pressedElevation: 0,
                    ),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 0.0),
                    inactiveTickMarkColor: Colors.transparent,
                    activeTickMarkColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: _state,
                    min: 0.0,
                    max: 5.0,
                    divisions: 10,
                    onChanged: (double value) {
                      setState(() {
                        _state = value;
                      });
                    },
                  ),
                ),
                // Mood
                const SizedBox(
                  height: kNormalVerticalSpacer,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Irritable'),
                    Text('Amicale, facile'),
                  ],
                ),
                const SizedBox(
                  height: kMicroVerticalSpacer,
                ),
                SliderTheme(
                  data: SliderThemeData(
                    thumbColor: kColorGreen,
                    activeTrackColor: kColorGreen,
                    inactiveTrackColor: kColorYellow,
                    overlayColor: Colors.blue.withOpacity(0.3),
                    trackHeight: 6.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12.0,
                      elevation: 1.0,
                      pressedElevation: 0,
                    ),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 0.0),
                    inactiveTickMarkColor: Colors.transparent,
                    activeTickMarkColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: _mood,
                    min: 0.0,
                    max: 5.0,
                    divisions: 10,
                    onChanged: (double value) {
                      setState(() {
                        _mood = value;
                      });
                    },
                  ),
                ),
                // Stress
                const SizedBox(
                  height: kNormalVerticalSpacer,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Stressé'),
                    Text('Relax'),
                  ],
                ),
                const SizedBox(
                  height: kMicroVerticalSpacer,
                ),
                SliderTheme(
                  data: SliderThemeData(
                    thumbColor: kColorGreen,
                    activeTrackColor: kColorGreen,
                    inactiveTrackColor: kColorYellow,
                    overlayColor: Colors.blue.withOpacity(0.3),
                    trackHeight: 6.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12.0,
                      elevation: 1.0,
                      pressedElevation: 0,
                    ),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 0.0),
                    inactiveTickMarkColor: Colors.transparent,
                    activeTickMarkColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: _stress,
                    min: 0.0,
                    max: 5.0,
                    divisions: 10,
                    onChanged: (double value) {
                      setState(() {
                        _stress = value;
                      });
                    },
                  ),
                ),
                // Anxiety
                const SizedBox(
                  height: kNormalVerticalSpacer,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Angoissé'),
                    Text('Calme'),
                  ],
                ),
                const SizedBox(
                  height: kMicroVerticalSpacer,
                ),
                SliderTheme(
                  data: SliderThemeData(
                    thumbColor: kColorGreen,
                    activeTrackColor: kColorGreen,
                    inactiveTrackColor: kColorYellow,
                    overlayColor: Colors.blue.withOpacity(0.3),
                    trackHeight: 6.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12.0,
                      elevation: 1.0,
                      pressedElevation: 0,
                    ),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 0.0),
                    inactiveTickMarkColor: Colors.transparent,
                    activeTickMarkColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: _anxiety,
                    min: 0.0,
                    max: 5.0,
                    divisions: 10,
                    onChanged: (double value) {
                      setState(() {
                        _anxiety = value;
                      });
                    },
                  ),
                ),

                // Feeling Level
                const SizedBox(
                  height: kBigVerticalSpacer,
                ),
                const Text(
                  "Veuillez choisir le niveau correspondant à votre ressenti immédiat à l'aide du barème suivant",
                  style: kLabelGreenText,
                ),
                const SizedBox(
                  height: kSmallHorizontalSpacer,
                ),
                Form(
                  key: feelingLevelFormKey,
                  child: SelectListInput(
                    value: _fellingLevel,
                    list: feelingLevelList,
                    hintText: AppLocalizations.of(context)!
                        .dReport__feelingLevelLabel,
                  ),
                ),

                feelingLevelController.error != null
                    ? TextError(
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
                                  color: checkFormDoneController.error
                                      ? kColorRed
                                      : kColorGreen,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
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
                    const Expanded(
                        child: Text(
                      "Je valide avoir bien rempli le formulaire avec attention",
                      style: kLabelGreenText,
                    ))
                  ],
                ),

                // Button
                SizedBox(
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
                SizedBox(
                  height: kNormalVerticalSpacer,
                ),
              ],
            ),
          ),
        ));
  }
}

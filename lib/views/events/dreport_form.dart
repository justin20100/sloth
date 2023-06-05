import 'package:flutter/material.dart';
import 'package:sloth/models/EventsModel.dart';
import 'package:sloth/tools/functions.dart';
import '../../routes/routes.dart';
import '../../styles/constants.dart';
import '../../tools/button.dart';
import 'package:intl/intl.dart';

class DReportForm extends StatefulWidget {
  const DReportForm({Key? key}) : super(key: key);

  @override
  State<DReportForm> createState() => _DReportFormState();
}

class _DReportFormState extends State<DReportForm> {
  final EventsModel _eventsModel = EventsModel();
  TextEditingController _WakeUpController = TextEditingController();
  TextEditingController _SleepController = TextEditingController();
  final _dReportFormKey = GlobalKey<FormState>();
  late double _sleepevaluation = 2.5;
  late double _cognitiveevaluation = 2.5;
  late double _physiqueevaluation = 2.5;
  late String _moreinfos;
  late double _motivation = 2.5;
  late double _euphoria = 2.5;
  late double _state = 2.5;
  late double _mood = 2.5;
  late double _stress = 2.5;
  late double _anxiety = 2.5;
  late double _fatigue = 2.5;
  late DateTime _sleep;
  late DateTime _wakeup;
  String? _fellingLevel;
  bool _checkformdone = false;
  String user_id ="";
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

  Future<void> _onWakeUpChange(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      _wakeup = DateTime(kToday.year, kToday.month, kToday.day, pickedTime.hour, pickedTime.minute);
      // Format the selected time as desired
      String formattedTime = pickedTime.format(context);
      setState(() {
        _WakeUpController.text = formattedTime;
      });
    }
  }

  Future<void> _onSleepChange(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      _sleep = DateTime(kToday.year, kToday.month, kToday.day, pickedTime.hour, pickedTime.minute);;
      // Format the selected time as desired
      String formattedTime = pickedTime.format(context);
      setState(() {
        _SleepController.text = formattedTime;
      });
    }
  }

  @override
  void initState() {
    user_id = getUserID();
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
          title: Column(children: [
            Text(
              getTheDateNM(),
              style: kAppBarTextStyle,
            ),
            SizedBox(height: 5,),
            Text('Rapport quotidien',style: TextStyle(fontSize: 12, color: kColorGreen, fontWeight: FontWeight.bold),),
          ],)
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: kNormalHorizontalSpacer,
                right: kNormalHorizontalSpacer),
            child: Form(
              key: _dReportFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kNormalVerticalSpacer),
                  //Text intro
                  const Text(
                    'Comme chaque jour ce formulaire représente votre ressenti sur la journée que vous venez de passer. Remplissez ce rapport avec précaution.',
                    style: k16BasicTextStyle,
                  ),
                  const SizedBox(height: kNormalVerticalSpacer),

                  // wakeup
                  const Text(
                    "Heure de lever",
                    style: kLabelGreenText,
                  ),
                  const SizedBox(
                    height: kSmallHorizontalSpacer,
                  ),
                  TextField(
                    readOnly: true,
                    controller: _WakeUpController,
                    onTap: () => {_onWakeUpChange(context)},
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.all(kSmallVerticalSpacer),
                      hintText: '08:20',
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
                      errorStyle: TextStyle(),
                      fillColor: kColorWhite,
                      filled: true,
                    ),
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
                  TextField(
                    readOnly: true,
                    controller: _SleepController,
                    onTap: () => {_onSleepChange(context)},
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.all(kSmallVerticalSpacer),
                      hintText: '08:20',
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
                      errorStyle: TextStyle(),
                      fillColor: kColorWhite,
                      filled: true,
                    ),
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
                      contentPadding:
                          const EdgeInsets.all(kSmallVerticalSpacer),
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
                      errorStyle: TextStyle(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
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
                  // Fatigue
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
                      value: _fatigue,
                      min: 0.0,
                      max: 5.0,
                      divisions: 10,
                      onChanged: (double value) {
                        setState(() {
                          _fatigue = value;
                        });
                      },
                    ),
                  ),

                  // Sleep
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
                  DecoratedBox(
                    decoration: const ShapeDecoration(
                      color: kColorWhite,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: kColorGreen),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kSmallHorizontalSpacer),
                      child: DropdownButton<String>(
                        value: _fellingLevel,
                        isExpanded: true,
                        underline: const SizedBox(),
                        hint: const Text('Sélectionnez une option'),
                        onChanged: (String? value) {
                          setState(() {
                            _fellingLevel = value!;
                          });
                        },
                        items: feelingLevelList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: k16BasicTextStyle,),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // check form done
                  const SizedBox(
                    height: kBigVerticalSpacer,
                  ),
                  Row(
                    children: [
                      FormField<bool>(
                        validator: (value) {
                          if (_checkformdone == false) {
                            return 'Required.';
                          }
                        },
                        builder: (FormFieldState<bool> field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start,
                            children: [
                              Checkbox(
                                activeColor: kColorGreen,
                                checkColor: kColorYellow,
                                side: MaterialStateBorderSide
                                    .resolveWith(
                                      (states) =>
                                      BorderSide(
                                        width: 1.4,
                                        color: field.hasError
                                            ? kColorRed
                                            : kColorGreen,
                                      ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      4),
                                ),
                                materialTapTargetSize: MaterialTapTargetSize
                                    .shrinkWrap,
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
                          child: Text("Je valide avoir bien rempli le formulaire avec attention", style: kLabelGreenText,)
                      )
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
                          if (_dReportFormKey.currentState != null &&
                              _dReportFormKey.currentState!.validate()) {
                            _eventsModel.createDReport(kToday, _anxiety, _cognitiveevaluation, _euphoria, _mood, _moreinfos, _motivation, _physiqueevaluation, _sleep, _sleepevaluation, _state, _stress, _wakeup, user_id);
                            Navigator.pushNamed(context, kHomeRoute);
                          }
                        }),
                  ),
                  SizedBox(
                    height: kNormalVerticalSpacer,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

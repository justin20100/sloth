import 'package:flutter/material.dart';
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
  TextEditingController timeinput = TextEditingController();
  final _dReportFormKey = GlobalKey<FormState>();
  late DateTime _wakeup;
  late DateTime _sleep;
  late num _sleepevaluation;
  late num _cognitiveevaluation;
  late num _physiqueevaluation;
  late String _moreinfos;
  late num _motivation;
  late num _euphoria;
  late num _state;
  late num _stress;
  late num _mood;
  late num _anxiety;

  @override
  void initState() {
    timeinput.text = "";
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
          title: Text(
            getTheDateNM(),
            style: kAppBarTextStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: kNormalHorizontalSpacer * 2,
                right: kNormalHorizontalSpacer * 2),
            child: Form(
              key: _dReportFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kNormalVerticalSpacer),
                  //Text intro
                  const Text('Comme chaque jour ce formulaire représente votre ressenti sur la journée que vous venez de passer.', style: k16BasicTextStyle,),
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
                    controller: timeinput,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(kSmallVerticalSpacer),
                      hintText: timeinput.text.isNotEmpty?timeinput.text:"Selectionez une heure",
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
                    readOnly: true,
                    onTap: () async {
                      TimeOfDay pickedTime =  await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if(pickedTime != null ){
                        print(pickedTime.format(context));   //output 10:51 PM
                        DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                        print(parsedTime); //output 1970-01-01 22:53:00.000
                        String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                        print(formattedTime); //output 14:59:00
                        //DateFormat() is from intl package, you can format the time on any pattern you need.

                        setState(() {
                          timeinput.text = formattedTime; //set the value of text field.
                        });
                      }else{
                        print("Time is not selected");
                      }
                    },
                  ),

                  // Button
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Button(
                        label: 'Enregistrer',
                        onPressed: () {
                          if (_dReportFormKey.currentState != null && _dReportFormKey.currentState!.validate()) {
                            Navigator.pushNamed(context, kHomeRoute);
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

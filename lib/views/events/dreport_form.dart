import 'package:flutter/material.dart';
import '../../routes/routes.dart';
import '../../styles/constants.dart';
import '../../tools/button.dart';

class DReportForm extends StatefulWidget {
  const DReportForm({Key? key}) : super(key: key);

  @override
  State<DReportForm> createState() => _DReportFormState();
}

class _DReportFormState extends State<DReportForm> {
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
            getTheDate(),
            style: kheadingPageTextStyle,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


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

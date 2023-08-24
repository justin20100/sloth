import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/widgets/button.dart';

class WeekReportHomeBlock extends StatelessWidget {
  const WeekReportHomeBlock({Key? key, required this.text, required this.buttonText , required this.route}) : super(key: key);
  final String text;
  final String buttonText;
  final String route;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kHomeBoxDecoration,
      padding: const EdgeInsets.only(
          top: kNormalVerticalSpacer,
          right: kNormalHorizontalSpacer,
          bottom: kNormalVerticalSpacer,
          left: kNormalHorizontalSpacer),
      child: Column(
        children: [
          Text(
            text,
            style: kHomeBoxesTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: kMicroVerticalSpacer * 3,
          ),
          Center(
            child: Button(
              label: buttonText,
              onPressed: () {
                Navigator.pushNamed(context, route);
              },
            ),
          )
        ],
      ),
    );
  }
}

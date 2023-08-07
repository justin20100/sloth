import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';

class DayRepportHomeBloc extends StatelessWidget {
  const DayRepportHomeBloc({Key? key, required this.text}) : super(key: key);
  final String text;

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
              label: 'Remplir',
              onPressed: () {
                Navigator.pushNamed(context, kDReportRoute);
              },
            ),
          )
        ],
      ),
    );;
  }
}

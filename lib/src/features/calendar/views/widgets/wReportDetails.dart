import 'package:flutter/material.dart';

class WReportDetails extends StatelessWidget {
  Map eventDetails;
  WReportDetails({Key? key, required this.eventDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('le titre hebdomadaire'),
      ],
    );
  }
}

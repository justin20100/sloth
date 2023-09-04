import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sloth/src/features/calendar/views/widgets/detailsSlider.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WReportDetails extends StatelessWidget {
  Map eventDetails;

  WReportDetails({Key? key, required this.eventDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime startdate = eventDetails['date'].subtract(Duration(days: 6));
    List<_ChartData> data = [
      _ChartData('Motivé', eventDetails['results']['motivation']),
      _ChartData('Euphorique', eventDetails['results']['euphoria']),
      _ChartData('Frais (épuisement)', eventDetails['results']['state']),
      _ChartData('Amicale et facile', eventDetails['results']['mood']),
      _ChartData('Relaxé', eventDetails['results']['stress']),
      _ChartData('Calme', eventDetails['results']['anxiety'])
    ];
    TooltipBehavior _tooltip = TooltipBehavior(enable: true);
    return ListView(
      children: [
        // Title
        const SizedBox(
          height: kBigVerticalSpacer,
        ),
        const Center(
            child: Text(
          'Rapport Hebdomadaire',
          style: kEventDetailsTitleTextStyle,
        )),
        const SizedBox(
          height: kMicroVerticalSpacer * 2,
        ),
        Center(
          child: Text(
              ""
              "Du ${DateFormat.MMMMd(Localizations.localeOf(context).toString()).format(startdate)} au ${DateFormat.MMMMd(Localizations.localeOf(context).toString()).format(eventDetails['date'])}",
              style: kEventDetailsDateTextStyle),
        ),
        const SizedBox(
          height: kBigVerticalSpacer,
        ),

        const Text('Heure moyenne de lever', style: kLabelGreenText),
        const SizedBox(
          height: kMicroVerticalSpacer,
        ),
        Text(DateFormat.jm(Localizations.localeOf(context).toString()).format(eventDetails['results']['wakeUp'].toDate()), style: k16BasicTextStyle),
        const SizedBox(
          height: kNormalVerticalSpacer,
        ),

        const Text('Heure moyenne de couché', style: kLabelGreenText),
        const SizedBox(
          height: kMicroVerticalSpacer,
        ),
        Text(DateFormat.jm(Localizations.localeOf(context).toString()).format(eventDetails['results']['sleep'].toDate()), style: k16BasicTextStyle),
        const SizedBox(
          height: kNormalVerticalSpacer,
        ),

        const Text('Moyenne de qualité du sommeil', style: kLabelGreenText),
        const SizedBox(
          height: kMicroVerticalSpacer * 2,
        ),
        DetailsSlider(data: eventDetails['results']['sleepEvaluation']),
        const SizedBox(
          height: kNormalVerticalSpacer,
        ),

        const Text('Moyenne du niveau de fatigue cognitive', style: kLabelGreenText),
        const SizedBox(
          height: kMicroVerticalSpacer * 2,
        ),
        DetailsSlider(data: eventDetails['results']['cognitiveEvaluation']),
        const SizedBox(
          height: kNormalVerticalSpacer,
        ),

        const Text('Moyenne du niveau de fatigue physique', style: kLabelGreenText),
        const SizedBox(
          height: kMicroVerticalSpacer * 2,
        ),
        DetailsSlider(data: eventDetails['results']['physiqueEvaluation']),
        const SizedBox(
          height: kNormalVerticalSpacer,
        ),

        const Text("Dans l'ensemble pour cette semaine vous vous sentez", style: kLabelGreenText),
        const SizedBox(
          height: kMicroVerticalSpacer * 2,
        ),

        SfCartesianChart(
            primaryXAxis: CategoryAxis(isVisible: false),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 10),
            tooltipBehavior: _tooltip,
            series: <ChartSeries<_ChartData, String>>[
              BarSeries<_ChartData, String>(
                isVisibleInLegend: false,
                borderRadius: BorderRadius.circular(4),
                  dataSource: data,
                  dataLabelMapper: (_ChartData data, _) => data.x,
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true
                  ),
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  name: "Résultat en %",
                  color: kColorGreen)]),

        const SizedBox(
          height: kBigVerticalSpacer,
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

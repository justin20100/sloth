import 'package:flutter/foundation.dart';
import 'package:sloth/src/features/reports/models/DReportModel.dart';
import 'package:sloth/src/features/reports/models/WReportModel.dart';
import 'package:sloth/src/utils/functions.dart';

class HomeController {
  Future<bool> dReportHomeBlockVisibility() async {
    final DReportModel dReportModel = DReportModel();
    bool dReportAlreadyCompleted = await dReportModel.checkDReportForADay(
        DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (4 < DateTime.now().hour &&
        DateTime.now().hour < 12 &&
        !dReportAlreadyCompleted) {
      if (kDebugMode) {
        print("Il faut afficher le block d");
      }
      return true;
    }
    if (kDebugMode) {
      print("Il ne faut pas afficher le block d");
    }
    return false;
  }

  Future<bool> wReportHomeBlockVisibility() async {
    final WReportModel wReportModel = WReportModel();
    bool alreadyCalculated = await wReportModel.checkWReportForAWeek(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (DateTime.now().weekday == 3 &&
        DateTime.now().hour > 12 &&
        !alreadyCalculated) {
      if (kDebugMode) {
        print("Il faut afficher le block w");
      }
      return true;
    }
    if (kDebugMode) {
      print("Il ne faut pas afficher le block w");
    }
    return false;
  }

  calculateWReport() async {
    DivideAndFormat(value, divider) {
      return double.parse((value / divider).toStringAsFixed(2));
    }

    // récuperer
    DReportModel dreportModel = DReportModel();
    WReportModel wReportModel = WReportModel();
    Tools tools = Tools();
    DateTime startDay =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).subtract(const Duration(days: 7));
    DateTime lastDay =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    List dReports = await dreportModel.getDReportInARange(startDay, lastDay);

    // calculer
    num numberOfReportInAWeek = dReports.length;
    num anxiety = 0;
    num cognitiveEvaluation = 0;
    num euphoria = 0;
    num mood = 0;
    num motivation = 0;
    num physiqueEvaluation = 0;
    num sleepEvaluation = 0;
    num state = 0;
    num stress = 0;
    DateTime sleep;
    num totalMinutesSleep = 0;
    DateTime wakeUp;
    num totalMinutesWakeUp = 0;
    for (var element in dReports) {
      anxiety += element['results']['anxiety'];
      cognitiveEvaluation += element['results']['cognitiveEvaluation'];
      euphoria += element['results']['euphoria'];
      mood += element['results']['mood'];
      motivation += element['results']['motivation'];
      physiqueEvaluation += element['results']['physiqueEvaluation'];
      sleepEvaluation += element['results']['sleepEvaluation'];
      state += element['results']['state'];
      stress += element['results']['stress'];
      totalMinutesSleep += element['results']['sleep'].toDate().hour * 60 +
          element['results']['sleep'].toDate().minute;
      totalMinutesWakeUp += element['results']['wakeUp'].toDate().hour * 60 +
          element['results']['wakeUp'].toDate().minute;
    }

    anxiety = DivideAndFormat(anxiety, numberOfReportInAWeek);
    cognitiveEvaluation =
        DivideAndFormat(cognitiveEvaluation, numberOfReportInAWeek);
    euphoria = DivideAndFormat(euphoria, numberOfReportInAWeek);
    mood = DivideAndFormat(mood, numberOfReportInAWeek);
    motivation = DivideAndFormat(motivation, numberOfReportInAWeek);
    physiqueEvaluation =
        DivideAndFormat(physiqueEvaluation, numberOfReportInAWeek);
    sleepEvaluation = DivideAndFormat(sleepEvaluation, numberOfReportInAWeek);
    state = DivideAndFormat(state, numberOfReportInAWeek);
    stress = DivideAndFormat(stress, numberOfReportInAWeek);

    int averageMinutesSleep = totalMinutesSleep ~/ numberOfReportInAWeek;
    int averageHoursSleep = averageMinutesSleep ~/ 60;
    int averageRemainingMinutesSleep = averageMinutesSleep % 60;
    sleep = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 1,
        averageHoursSleep,
        averageRemainingMinutesSleep);
    int averageMinutesWakeUp = totalMinutesWakeUp ~/ numberOfReportInAWeek;
    int averageHoursWakeUp = averageMinutesWakeUp ~/ 60;
    int averageRemainingMinutesWakeUp = averageMinutesWakeUp % 60;
    wakeUp = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 1,
        averageHoursWakeUp,
        averageRemainingMinutesWakeUp);

    // enregister
    String userId = await tools.getUserID();
    await wReportModel.createWReport(
        DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 1),
        anxiety,
        cognitiveEvaluation,
        euphoria,
        mood,
        '',
        motivation,
        physiqueEvaluation,
        sleep,
        sleepEvaluation,
        state,
        stress,
        wakeUp,
        userId);
  }
}

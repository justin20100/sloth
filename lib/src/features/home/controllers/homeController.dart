import 'package:flutter/foundation.dart';
import 'package:sloth/src/features/reports/models/DReportModel.dart';
import 'package:sloth/src/features/reports/models/WReportModel.dart';

class HomeController {
  Future<bool> dReportHomeBlockVisibility() async {
    final DReportModel dReportModel = DReportModel();
    bool dReportAlreadyCompleted = await dReportModel.checkDReportForADay(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (4<DateTime.now().hour && DateTime.now().hour<12 && !dReportAlreadyCompleted) {
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
    bool alreadyCalculated = await wReportModel.checkWReportForAWeek(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
     if ( DateTime.now().weekday == 7 && DateTime.now().hour>12 && alreadyCalculated) {
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
}
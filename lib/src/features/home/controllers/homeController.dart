import 'package:flutter/foundation.dart';
import 'package:sloth/src/features/home/models/homeModel.dart';

class HomeController {
  Future<bool> homeBlockVisibility() async {
    final HomeModel homeModel = HomeModel();
    bool alreadyCompleted = await homeModel.checkIfReportAlreadyCompleted();
    if (4<DateTime.now().hour && DateTime.now().hour<17 && !alreadyCompleted) {
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


  Future<bool> weekBlockVisibility() async {
    final HomeModel homeModel = HomeModel();
    bool alreadyCalculated = await homeModel.checkIfWReportAlreadyCalculated();
     if ( DateTime.now().weekday == 1 && alreadyCalculated) {
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
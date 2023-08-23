import 'package:flutter/foundation.dart';
import 'package:sloth/src/features/home/models/homeModel.dart';

class HomeController {
  Future<bool> homeBlockVisibility() async {
    final HomeModel homeModel = HomeModel();
    bool alreadyCompleted = await homeModel.checkIfReportAlreadyCompleted();
    if (4<DateTime.now().hour && DateTime.now().hour<24 && !alreadyCompleted) {
      if (kDebugMode) {
        print("Il faut afficher le block");
      }
      return true;
    }
    if (kDebugMode) {
      print("Il ne faut pas afficher le block");
    }
    return false;
  }


  Future<bool> weekBlockVisibility() async {
    final HomeModel homeModel = HomeModel();
    bool alreadyCalculated = await homeModel.checkIfWReportAlreadyCalculated();
     if ( DateTime.now().weekday == 3 && !alreadyCalculated) {
       if (kDebugMode) {
         print("Il faut afficher le block");
       }
       return true;
     }
     if (kDebugMode) {
       print("Il ne faut pas afficher le block");
     }
     return false;
   }
}
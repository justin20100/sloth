import 'package:flutter/foundation.dart';
import 'package:sloth/src/features/home/models/homeModel.dart';
import 'package:sloth/src/utils/functions.dart';

class HomeController {
  Future<bool> homeBlockVisibility() async {
    final HomeModel homeModel = HomeModel();
    bool alreadyCompleted = await homeModel.checkIfReportAlreadyCompleted();

    if (4<DateTime.now().hour && DateTime.now().hour<18 && !alreadyCompleted) {
      if (kDebugMode) {
        print('Afficher le bloc');
      }
      return true;
    }
    if (kDebugMode) {
      print('Ne pas afficher le bloc');
    }
    return false;
  }
}
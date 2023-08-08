import 'package:flutter/material.dart';
import 'package:sloth/src/features/reports/models/DReportModel.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/utils/functions.dart';

class WakeUpController {
  String text = '';
  late String? error = null;

  bool validate(value) {
    if (value.isEmpty) {
      error = 'Veuillez saisir votre nom';
      return false;
    }
    error = null;
    return true;
  }
}

class SleepController {
  String text = '';
  late String? error = null;

  bool validate(value) {
    if (value.isEmpty) {
      error = 'Veuillez saisir votre adresse e-mail';
      return false;
    }
    error = null;
    return true;
  }
}

// class DReportController {
//   validateForm(
//       context,
//       dReportFormKey,
//       anxiety,
//       cognitiveevaluation,
//       euphoria,
//       mood,
//       moreinfos,
//       motivation,
//       physiqueevaluation,
//       sleep,
//       sleepevaluation,
//       state,
//       stress,
//       wakeup) {
//     final DReportModel dReportModel = DReportModel();
//     final userId = getUserID();
//
//     if(moreinfos){
//     }
//
//
//
//
//
//     if (dReportFormKey.currentState != null && dReportFormKey.currentState!.validate()) {
//       dReportModel.createDReport(
//           kToday,
//           anxiety,
//           cognitiveevaluation,
//           euphoria,
//           mood,
//           moreinfos,
//           motivation,
//           physiqueevaluation,
//           sleep,
//           sleepevaluation,
//           state,
//           stress,
//           wakeup,
//           userId);
//       Navigator.pushNamed(context, kHomeRoute);
//     }
//   }
// }

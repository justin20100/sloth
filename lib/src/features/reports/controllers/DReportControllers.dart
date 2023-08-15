import 'package:flutter/material.dart';
import 'package:sloth/src/features/reports/models/DReportModel.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/utils/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WakeUpController {
  late String? error = null;
  bool validate(context, value) {
    if (value.isEmpty) {
      error = AppLocalizations.of(context)?.dReport__wakeUpError;
      return false;
    }
    error = null;
    return true;
  }
}

class SleepController {
  late String? error = null;
  bool validate(context, value) {
    if (value.isEmpty) {
      error = AppLocalizations.of(context)?.dReport__sleepError;
      return false;
    }
    error = null;
    return true;
  }
}

class FeelingLevelController {
  late String? error = null;
  bool validate(context, value) {
    if (value == null) {
      error = AppLocalizations.of(context)?.dReport__feelingLevelError;
      return false;
    }
    error = null;
    return true;
  }
}

class CheckFormDoneController {
  late bool error = false;
  bool validate(context, bool value) {
    if (value) {
      error = false;
      return true;
    }
    error = true;
    return false;
  }
}
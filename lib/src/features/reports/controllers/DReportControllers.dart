import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WakeUpInputController {
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

class SleepInputController {
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

class FeelingLevelSelectController {
  late String? error= null;
  bool validate(context, value) {
    if (value == null) {
      error = AppLocalizations.of(context)?.dReport__feelingLevelError;
      return false;
    }
    error = null;
    return true;
  }
}

class FormDoneCheckboxController {
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
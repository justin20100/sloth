class SelectedCountController {
  late String? error = null;
  bool validate(context, selectedCount) {
    if (selectedCount >= 2 ) {
      error = null;
      return true;
    } else {
      error = "Vous n'avez pas séléctionné minimum 2 objectifs";
      return false;
    }
  }
}
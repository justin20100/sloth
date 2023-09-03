class FirstnameInputController {
  late String? error = null;
  bool validate(context, firstname) {
    if (firstname.isNotEmpty) {
          error = null;
          return true;
    } else {
      error = "Il manque un prénom";
      return false;
    }
  }
}
class LastnameInputController {
  late String? error = null;
  bool validate(context, lastname)  {
    if (lastname.isNotEmpty) {
          error = null;
          return true;
    } else {
      error = "Il manque un nom";
      return false;
    }
  }
}
class PhoneInputController {
  late String? error = null;
  bool validate(context, phone) {
    if (phone=="" || RegExp(r'^[0-9]{10}$').hasMatch(phone)) {
          error = null;
          return true;
    } else {
      error = "Exemple de format attendu: 0495612324";
      return false;
    }
  }
}
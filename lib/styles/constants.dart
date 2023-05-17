import 'package:flutter/material.dart';

// colors
const kColorDarkGreen = Color(0xFF2F4F4F);
const kColorGreen = Color(0xFF305D5D);
const kColorYellow = Color(0xFFFFC65A);
const kColorCream = Color(0xFFFFFAF3);
const kColorGrey = Color(0xFF3A3A3A);
const kColorBlack = Color(0xFF000000);
const kColorWhite = Color(0xFFFFFFFF);

// Text color
const kMainBackgroundColor = kColorCream;
const kMainTextColor = kColorGrey;
const kLabelColor = kMainTextColor;

// vertical spacer
const double kBigVerticalSpacer = 35;
const double kNormalVerticalSpacer = 25;
const double kSmallVerticalSpacer = 15;
const double kMicroVerticalSpacer = 5;

// Horizontal spacer
const double kBigHorizontalSpacer = 30;
const double kNormalHorizontalSpacer = 20;
const double kSmallHorizontalSpacer = 10;

// Border radius & shadow
const BorderRadius kBorderRadiusItem = BorderRadius.all(Radius.circular(7));
List<BoxShadow> kBoxShadowItem = [
  BoxShadow(
    color: Colors.black.withOpacity(0.16),
    blurRadius: 7,
    offset: const Offset(1, 0),
  )
];
final kBoxDecoration = BoxDecoration(
    color: kColorWhite,
    boxShadow: kBoxShadowItem,
    borderRadius: kBorderRadiusItem
);
final kHomeBoxDecoration = BoxDecoration(
    color: kColorWhite,
    boxShadow: kBoxShadowItem,
    borderRadius: const BorderRadius.all(Radius.circular(13))
);

// Text Styles
const kBigGreenText = TextStyle(
  fontFamily: 'Inter',
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: kColorGreen,
  decoration: TextDecoration.none,
);
const kButtonTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: kColorWhite,
  decoration: TextDecoration.none,
);
const kLabelGreenText = TextStyle(
  fontFamily: 'Inter',
  fontSize: 16.0,
  height: 1.3,
  fontWeight: FontWeight.bold,
  color: kColorGreen,
  decoration: TextDecoration.none,
);
const kSmallLinkGreenText = TextStyle(
  fontFamily: 'Inter',
  fontSize: 14.0,
  color: kColorGreen,
  decoration: TextDecoration.none,
);
const kCheckboxText = TextStyle(
  fontFamily: 'Inter',
  fontSize: 12.0,
  color: kColorBlack,
  decoration: TextDecoration.none,
);

const kTitleH1Style = TextStyle(
  fontSize: 24.0,
  fontFamily: 'Inter',
  fontWeight: FontWeight.bold,
  color: kColorDarkGreen,
  decoration: TextDecoration.none,
);
const kBasicTextStyle = TextStyle(
  fontSize: 16.0,
  height: 1.3,
  fontFamily: 'Inter',
  color: kColorBlack,
  decoration: TextDecoration.none,
);
const k18BasicTextStyle = TextStyle(
  fontSize: 18.0,
  height: 1.4,
  fontFamily: 'Inter',
  color: kColorBlack,
  decoration: TextDecoration.none,
);
const kDaysCalendarTextStyle = TextStyle(
  fontSize: 16.0,
  height: 1,
  fontFamily: 'Inter',
  fontWeight: FontWeight.bold,
  color: kColorYellow,
  decoration: TextDecoration.none,
);
const kNumberDaysCalendarTextStyle = TextStyle(
  fontSize: 15.0,
  height: 1,
  fontFamily: 'Inter',
  color: kColorGrey,
  decoration: TextDecoration.none,
);
const kDateTextStyle = TextStyle(
  fontSize: 20.0,
  height: 1,
  fontFamily: 'Inter',
  fontWeight: FontWeight.bold,
  color: kColorGreen,
  decoration: TextDecoration.none,
);
const kHomeBoxesTextStyle = TextStyle(
  fontSize: 18.0,
  height: 1.3,
  fontFamily: 'Inter',
  fontWeight: FontWeight.bold,
  color: kColorGreen,
  decoration: TextDecoration.none,
);

// Dates
final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
String getTheDate() {
  String day = '';
  String month = '';
  switch (kToday.weekday) {
    case 1:
      day = 'Lundi';
      break;
    case 2:
      day = 'Mardi';
      break;
    case 3:
      day = 'Mercredi';
      break;
    case 4:
      day = 'Jeudi';
      break;
    case 5:
      day = 'Vendredi';
      break;
    case 6:
      day = 'Samedi';
      break;
    case 7:
      day = 'Dimanche';
      break;
  }
  switch (kToday.month) {
    case 1:
      month = 'Janvier';
      break;
    case 2:
      month = 'Février';
      break;
    case 3:
      month = 'Mars';
      break;
    case 4:
      month = 'Avril';
      break;
    case 5:
      month = 'Mai';
      break;
    case 6:
      month = 'Juin';
      break;
    case 7:
      month = 'Juillet';
      break;
    case 8:
      month = 'Aout';
      break;
    case 9:
      month = 'Septembre';
      break;
    case 10:
      month = 'Octobre';
      break;
    case 11:
      month = 'Novembre';
      break;
    case 12:
      month = 'Decembre';
      break;
  }
  return day+' '+kToday.day.toString()+' '+month;
}

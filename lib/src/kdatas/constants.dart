import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// colors
const kColorDarkGreen = Color(0xFF2F4F4F);
const kColorGreen = Color(0xFF305D5D);
const kColorYellow = Color(0xFFFFC65A);
const kColorCream = Color(0xFFFFFAF3);
const kColorGrey = Color(0xFF3A3A3A);
const kColorBlack = Color(0xFF000000);
const kColorWhite = Color(0xFFFFFFFF);
const kColorRed = Color(0xFFFF0000);

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

// Border radius
const BorderRadius kBorderRadiusItem = BorderRadius.all(Radius.circular(7));

// Boxshadows
List<BoxShadow> kBoxShadowItem = [
  BoxShadow(
    color: Colors.black.withOpacity(0.16),
    blurRadius: 7,
    offset: const Offset(1, 0),
  )
];
List<BoxShadow> kDRepportBoxShadowItem = [
  BoxShadow(
    color: kColorYellow,
    blurRadius: 5,
    offset: const Offset(0, 0),
  )
];

// BoxDecorations
final kBoxDecoration = BoxDecoration(
    color: kColorWhite,
    boxShadow: kBoxShadowItem,
    borderRadius: kBorderRadiusItem
);
final kSnackbarBoxDecoration = BoxDecoration(
    color: kColorGreen,
);
final kHomeBoxDecoration = BoxDecoration(
    color: kColorWhite,
    boxShadow: kBoxShadowItem,
    borderRadius: const BorderRadius.all(Radius.circular(13))
);
final kHomeDRepportBoxDecoration = BoxDecoration(
    color: kColorWhite,
    boxShadow: kDRepportBoxShadowItem,
    borderRadius: const BorderRadius.all(Radius.circular(13))
);

// ------------- Text Styles
// Forms
const kButtonTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: kColorWhite,
  decoration: TextDecoration.none,
);
const kBigLabelTextStyle = TextStyle(
  fontSize: 20.0,
  height: 1.4,
  fontFamily: 'Inter',
  fontWeight: FontWeight.bold,
  color: kColorGreen,
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
  decoration: TextDecoration.underline,
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
const kErrorStyle = TextStyle(
  fontSize: 12.0,
  fontFamily: 'Inter',
  fontWeight: FontWeight.normal,
  color: kColorRed,
  decoration: TextDecoration.none,
);
//Calendar
const kNumberDaysCalendarTextStyle = TextStyle(
  fontSize: 15.0,
  height: 1,
  fontFamily: 'Inter',
  color: kColorGrey,
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
const kDayDateCalendarTextStyle = TextStyle(
  fontSize: 18.0,
  height: 1,
  fontFamily: 'Inter',
  fontWeight: FontWeight.bold,
  color: kColorGreen,
  decoration: TextDecoration.none,
);
// Basic Text
const k12BasicTextStyle = TextStyle(
  fontSize: 12.0,
  height: 1.2,
  fontFamily: 'Inter',
  color: kColorBlack,
  decoration: TextDecoration.none,
);
const k14BasicTextStyle = TextStyle(
  fontSize: 14.0,
  height: 1.2,
  fontFamily: 'Inter',
  color: kColorBlack,
  decoration: TextDecoration.none,
);
const k16BasicTextStyle = TextStyle(
  fontSize: 16.0,
  height: 1.4,
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
// Basic Title
const kh2BasicTextStyle = TextStyle(
  fontSize: 18.0,
  height: 1.4,
  fontFamily: 'Inter',
  fontWeight: FontWeight.bold,
  color: kColorGreen,
  decoration: TextDecoration.none,
);
// Burger menu
const kBurgerMenuTextStyle = TextStyle(
  fontSize: 18.0,
  height: 1,
  fontFamily: 'Inter',
  color: kColorGrey,
  decoration: TextDecoration.none,
);
const kBurgerMenuSmallTextStyle = TextStyle(
  fontSize: 14.0,
  height: 1,
  fontFamily: 'Inter',
  color: kColorDarkGreen,
  decoration: TextDecoration.none,
);
// AppBar
const kAppBarTextStyle = TextStyle(
  fontSize: 24.0,
  height: 1,
  fontFamily: 'Inter',
  fontWeight: FontWeight.bold,
  color: kColorDarkGreen,
  decoration: TextDecoration.none,
);

// Home - page
const kHomeBoxesTextStyle = TextStyle(
  fontSize: 18.0,
  height: 1.3,
  fontFamily: 'Inter',
  fontWeight: FontWeight.bold,
  color: kColorGreen,
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
// Introduction - page
const kIntroTitleTextStyle = TextStyle(
  fontSize: 20.0,
  height: 1,
  fontFamily: 'Inter',
  fontWeight: FontWeight.bold,
  color: kColorDarkGreen,
  decoration: TextDecoration.none,
);



// ------------- Dates Functions
final kToday = DateTime.now();
final kCalendarReference = DateTime(DateTime.now().year, DateTime.now().month);
final kFirstDay = DateTime(kCalendarReference.year, kCalendarReference.month -6);
final kLastDay = DateTime(kCalendarReference.year, kCalendarReference.month + 7, 0);
String getTheDate() {
  String day = '';
  String month = '';
  switch (kToday.weekday) {
    case 1:
      day = 'lundi';
      break;
    case 2:
      day = 'mardi';
      break;
    case 3:
      day = 'mercredi';
      break;
    case 4:
      day = 'jeudi';
      break;
    case 5:
      day = 'vendredi';
      break;
    case 6:
      day = 'samedi';
      break;
    case 7:
      day = 'dimanche';
      break;
  }
  switch (kToday.month) {
    case 1:
      month = 'janvier';
      break;
    case 2:
      month = 'février';
      break;
    case 3:
      month = 'mars';
      break;
    case 4:
      month = 'avril';
      break;
    case 5:
      month = 'mai';
      break;
    case 6:
      month = 'juin';
      break;
    case 7:
      month = 'juillet';
      break;
    case 8:
      month = 'aout';
      break;
    case 9:
      month = 'septembre';
      break;
    case 10:
      month = 'octobre';
      break;
    case 11:
      month = 'novembre';
      break;
    case 12:
      month = 'decembre';
      break;
  }
  return day+' '+kToday.day.toString()+' '+month;
}
String getTheDateNM() {
  String day = '';
  String month = '';
  switch (kToday.month) {
    case 1:
      month = 'janvier';
      break;
    case 2:
      month = 'février';
      break;
    case 3:
      month = 'mars';
      break;
    case 4:
      month = 'avril';
      break;
    case 5:
      month = 'mai';
      break;
    case 6:
      month = 'juin';
      break;
    case 7:
      month = 'juillet';
      break;
    case 8:
      month = 'aout';
      break;
    case 9:
      month = 'septembre';
      break;
    case 10:
      month = 'octobre';
      break;
    case 11:
      month = 'novembre';
      break;
    case 12:
      month = 'decembre';
      break;
  }
  return '${kToday.day} $month';
}

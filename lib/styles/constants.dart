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

// Text Styles
const kBigGreenText = TextStyle(
  fontFamily: 'Inter',
  fontSize: 24.0,
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

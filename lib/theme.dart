import 'package:flutter/material.dart';
import 'constants.dart';

Color whiteColor =Color(0xffFBFBFB);
Color blackColor =Color(0xff000000);
Color lightYellowColor =Color(0xffFAF3E0);

TextStyle menuFilterTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w300,
  fontSize: 12,
);

TextStyle titleHorizontalCardTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w500,
  fontSize: 15,
);

TextStyle subtitleHorizontalCardTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w300,
  fontSize: 11,
);

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: darkYellowColor,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    );
}

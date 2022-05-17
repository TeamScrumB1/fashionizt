import 'package:flutter/material.dart';
import 'constants.dart';

Color whiteColor =Color(0xffFBFBFB);
Color blackColor =Color(0xff000000);
Color lightYellowColor =Color(0xffFAF3E0);

TextStyle menuFilterTextStyle = TextStyle(
  color: blacksand,
  fontWeight: FontWeight.w300,
  fontSize: 12,
);

//card explore desainer & mitra
TextStyle titleVerticalCardTextStyle = TextStyle(
  color: blacksand,
  fontWeight: FontWeight.w500,
  fontSize: 15,
);

TextStyle subtitleVerticalCardTextStyle = TextStyle(
  color: blacksand,
  fontWeight: FontWeight.w300,
  fontSize: 12,
);

//card homepage
TextStyle nameHorizontalCardTextStyle = TextStyle(
  color: blacksand,
  fontWeight: FontWeight.w600,
  fontSize: 15,
);

TextStyle ratingHorizontalCardTextStyle = TextStyle(
  color: blacksand,
  fontWeight: FontWeight.w400,
  fontSize: 13,
);

TextStyle bioHorizontalCardTextStyle = TextStyle(
  color: blacksand,
  fontWeight: FontWeight.w400,
  fontSize: 12,
);
TextStyle titleApps = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: blush,
);
TextStyle nameProductTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w600,
  fontSize: 17,
);
TextStyle priceProductTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w600,
  fontSize: 17,
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


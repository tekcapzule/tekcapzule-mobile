import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Color(0xffEBF3F9),
  focusColor: Colors.black,
  backgroundColor: Colors.white,
  primaryColor: Color(0xff69C4FF),
  hintColor: Color(0xffB3B3B3),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white)),
  textTheme: TextTheme(
    bodyText1: TextStyle(),
    headline2: TextStyle(),
    headline3: TextStyle(),
    headline4: TextStyle(),
    headline1: TextStyle(),
    subtitle1: TextStyle(color: Color(0xffA4BDD0)),
    subtitle2: TextStyle(color: Color(0xffA4BDD0)),
    headline6: TextStyle(),
    bodyText2: TextStyle(),
    caption: TextStyle(color: Color(0xffB3B3B3)),
  ),
);
final ThemeData appTheme = ThemeData(
  fontFamily: 'helvetica',
  focusColor: Colors.white,
  scaffoldBackgroundColor: Color(0xffF6F6F6),
  backgroundColor: Colors.white,
  primaryColor: Color(0xffE10045),
  primarySwatch: Colors.amber,
  hintColor: Color(0xffB3B3B3),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.black),
    headline2: TextStyle(),
    headline3: TextStyle(),
    headline4: TextStyle(),
    headline1: TextStyle(),
    subtitle1: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
    subtitle2: TextStyle(color: Color(0xffB2B2B2), fontWeight: FontWeight.bold, fontSize: 18.0),
    headline6: TextStyle(color: Colors.black),
    bodyText2: TextStyle(),
    caption: TextStyle(color: Color(0xffB3B3B3)),
  ),
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5

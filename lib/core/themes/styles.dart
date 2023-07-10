import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Color(0xffEBF3F9),
  focusColor: Colors.black,
  primaryColor: Color.fromARGB(255, 82, 5, 56),
  hintColor: Color(0xffB3B3B3),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white)),
  textTheme: TextTheme(
    bodyLarge: TextStyle(),
    displayMedium: TextStyle(),
    displaySmall: TextStyle(),
    headlineMedium: TextStyle(),
    displayLarge: TextStyle(),
    titleMedium: TextStyle(color: Color(0xffA4BDD0)),
    titleSmall: TextStyle(color: Color(0xffA4BDD0)),
    titleLarge: TextStyle(),
    bodyMedium: TextStyle(),
    bodySmall: TextStyle(color: Color(0xffB3B3B3)),
  ), colorScheme: ColorScheme.dark(background: Colors.white),
);
final ThemeData appTheme = ThemeData(
  fontFamily: 'helvetica',
  focusColor: Colors.white,
  scaffoldBackgroundColor: Color(0xffF6F6F6),
  primaryColor: Color(0xffE10045),
  hintColor: Color(0xffB3B3B3),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    displayMedium: TextStyle(),
    displaySmall: TextStyle(),
    headlineMedium: TextStyle(),
    displayLarge: TextStyle(),
    titleMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
    titleSmall: TextStyle(color: Color(0xffB2B2B2), fontWeight: FontWeight.bold, fontSize: 18.0),
    titleLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(),
    bodySmall: TextStyle(color: Color(0xffB3B3B3)),
  ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(background: Colors.white),
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

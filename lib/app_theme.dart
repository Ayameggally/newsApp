import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF39A552);
  static const Color white = Color(0xFFFFFFFF);
  //static const Color redColor =Color(0xffC91C22);
  static const Color navy = Color(0xff4F5A69);
  //static const Color pinkColor =Color(0xffED1E79);
  //static const Color brownColor =Color(0xffCF7E48);
  //static const Color blueColor =Color(0xff4882CF);
  //static const Color yellowColor =Color(0xffF2D352);
  static const Color grey = Color(0xFF79828B);
  static const Color black = Color(0xff303030);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(32),
          right: Radius.circular(32),
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: black,
      ),
    ),
  );
}

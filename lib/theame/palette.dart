import 'dart:ui';
import 'package:flutter/material.dart';

class Pallete {
  static const blackColor = Colors.black;
  static const greyColor = Colors.black54;
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var purple = Colors.purple.shade300;
  static var lightPurple = Color(0xFFF5F0FF);


  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.greyColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    primaryColor: purple,
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Pallete.lightPurple,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    primaryColor: purple,
  );

}
import 'package:flutter/material.dart';
import 'package:news_app/core/theme/colors_palettes.dart';

class ApplecationsThemeManager {
  static ThemeData lighttheme = ThemeData(
    primaryColor: ColorsPalettes.primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 100.0,
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(35),
              bottomLeft: Radius.circular(35))),
      backgroundColor: ColorsPalettes.primaryColor,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontFamily: 'Exo'),
      iconTheme: IconThemeData(size: 35, color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontFamily: 'Exo'),
      bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w600,
          fontFamily: 'Exo'),
      bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w400,
          fontFamily: 'Exo'),
    ),
  );
}

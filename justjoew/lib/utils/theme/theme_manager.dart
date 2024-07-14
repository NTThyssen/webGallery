import 'package:flutter/material.dart';
import 'package:justjoew/constants/costum_colors.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: Colors.blue,
  //textButtonTheme: const TextButtonThemeData(
  // style: ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.red))),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: blueThemePrimary,
      fontSize: 36.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'SourceCodePro',
      shadows: [
        Shadow(
          color: Colors.black, // Specify shadow color and opacity
          offset: Offset(2, 2), // Specify shadow offset
          blurRadius: 4, // Specify shadow blur radius
        ),
      ],
    ),
  ),
);

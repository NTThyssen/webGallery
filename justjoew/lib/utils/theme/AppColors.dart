import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF8dd1fc);
  static const Color primary50 = Color(0xFFE1F5FE);
  static const Color primary100 = Color(0xFFB3E5FC);
  static const Color primary200 = primary;
  static const Color primary300 = Color(0xFF4FC3F7);
  static const Color primary400 = Color(0xFF29B6F6);
  static const Color primary500 = Color(0xFF03A9F4);
  static const Color primary600 = Color(0xFF039BE5);
  static const Color primary700 = Color(0xFF0288D1);
  static const Color primary800 = Color(0xFF0277BD);
  static const Color primary900 = Color(0xFF01579B);

  static const Color background = Color(0xFF212121);
  static const Color formFill = Colors.white;
  static const Color formLabel = Colors.black;
  static const Color error = primary700;
  static const Color link = primary;
  static const Color divider = primary100;
  static const Color snackbarText = Colors.black;
  static const Color elevatedButtonText = Colors.black;
  static const Color listText = primary200;
  static const MaterialColor primarySwatch = MaterialColor(
  0xFF8dd1fc,
  <int, Color>{
    50: primary50,
    100: primary100,
    200: primary200,
    300: primary300,
    400: primary400,
    500: primary500,
    600: primary600,
    700: primary700,
    800: primary800,
    900: primary900,
  },
);

}

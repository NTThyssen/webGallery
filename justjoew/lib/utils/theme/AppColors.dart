import 'package:flutter/material.dart';

class AppColors {

  static const Color primary = Color(0xFF00AEEF);
  //static const Color primary300 = Color(0xFF66CFFF);
  static const Color darkBlue = Color(0xFF001F3F);
  static const Color black = Color(0xFF000000);
  static const Color darkGray = Color(0xFF2C2C2C);
  static const Color twitch = Color(0xFF6441A5); // Custom color for the Twitch icon
  static const Color text = Color(0xFFE0E0E0); // Light grey or any preferred color


// Primary Color Shades
static const Color primary50 = Color(0xFFE0F7FA);
static const Color primary100 = Color(0xFFB3E5FC);
static const Color primary200 = Color(0xFF81D4FA);
static const Color primary300 = Color(0xFF4FC3F7);
static const Color primary400 = primary; // Original primary color
static const Color primary500 = Color(0xFF0099CC);
static const Color primary600 = Color(0xFF008BB3);
static const Color primary700 = Color(0xFF007399);
static const Color primary800 = Color(0xFF005C80);
static const Color primary900 = Color(0xFF004366);


  // Background and Surface Colors
  static const Color background = Color(0xFF212121);
  static const Color formFill = Colors.white;
  static const Color packageBackground = Colors.white10; // Background for commission packages

  // Text Colors
  static const Color formLabel = Colors.black;
  static const Color snackbarText = Colors.black;
  static const Color elevatedButtonText = Colors.black;
  static const Color listText = primary200;
  static const Color link = primary;

  // Divider and Icon Colors
  static const Color divider = primary100;
  static const Color commissionIcons = primary300;

  // Error Color
  static const Color error = primary700;

  // Primary Swatch
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

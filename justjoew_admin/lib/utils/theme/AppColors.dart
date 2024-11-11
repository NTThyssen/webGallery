import 'package:flutter/material.dart';

class AppColors {
  // Primary Color (Main brand color)
  static const Color primary = Color(0xFF00AEEF);

  // Dark and Accent Colors
  static const Color darkBlue = Color(0xFF001F3F);
  static const Color black = Color(0xFF000000);
  static const Color darkGray = Color.fromARGB(255, 23, 23, 23);
    static const Color white = Color(0xFFFFFFFF);


  // Twitch Custom Color
  static const Color twitch = Color(0xFF6441A5); // Custom color for the Twitch icon

  // Text Colors
  static const Color textPrimary = Color(0xFFE0E0E0); // Light grey for standard text
  static const Color textSecondary = Color(0xFFB0BEC5); // A muted grey for secondary text
  static const Color link = primary; // Links in primary brand color
  static const Color price = primary500; // Price color with a bolder tone

  // Primary Color Shades (For gradients, button states, etc.)
  static const Color primary50 = Color(0xFFE0F7FA);
  static const Color primary100 = Color(0xFFB3E5FC);
  static const Color primary200 = Color(0xFF81D4FA);
  static const Color primary300 = Color(0xFF4FC3F7);
  static const Color primary400 = primary;
  static const Color primary500 = Color(0xFF0099CC); // Mid tone for buttons
  static const Color primary600 = Color(0xFF008BB3);
  static const Color primary700 = Color(0xFF007399);
  static const Color primary800 = Color(0xFF005C80);
  static const Color primary900 = Color(0xFF004366); // Darker shade for pressed buttons

  // Background and Surface Colors
  static const Color background = Color(0xFF1A1A1A); // Darker grey for contrast
  static const Color surface = Color(0xFF303030); // Dark surface color for containers
  static const Color formFill = Colors.white; // Form field background
  static const Color packageBackground = Colors.white12; // Slightly transparent white for subtle backgrounds

  // Divider and Icon Colors
  static const Color divider = Colors.white; // Lighter divider for soft separation
  static const Color icons = Color(0xFFFFFFFF); // White icons for dark backgrounds
  static const Color commissionIcons = primary300; // Lighter tone for icons in specific sections

  // Error and Warning Colors
  static const Color error = Color(0xFFEF5350); // Brighter red for better visibility
  static const Color warning = Color(0xFFFFA726); // A warmer color for warnings

  // Snackbar Text
  static const Color snackbarText = Colors.white; // White text for snackbar

  // Primary Swatch for consistent branding
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF00AEEF, // Base primary color
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

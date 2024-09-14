import 'package:flutter/material.dart';
import 'package:justjoew/constants/costum_colors.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: Colors.lightBlue,

  // AppBar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff212121),
    elevation: 1,
    iconTheme: IconThemeData(color: blueThemePrimary400),
    toolbarHeight: 105,
    titleTextStyle: TextStyle(
      color: blueThemePrimary400,
      fontSize: 36.0,
      fontFamily: 'SourceCodePro',
      fontWeight: FontWeight.bold,
    ),
  ),

  // Text themes
  textTheme: const TextTheme(
    bodyMedium: paragraphStyle,
    headlineMedium: smallTitleStyle,
    labelLarge: priceStyle,
    labelMedium: linkStyle,
    bodySmall: formLabelStyle,
    labelSmall: snackbarTextStyle,
    headlineLarge: headerStyle,
  ),

  // Input decoration theme for text fields
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(color: Colors.black),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: blueThemePrimary900),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: blueThemePrimary700),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: blueThemePrimary900),
    ),
    errorStyle: const TextStyle(
      color: blueThemePrimary,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      fontFamily: 'SourceCodePro',
    ),
  ),

  // ElevatedButton theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: blueThemePrimary300,
      minimumSize: const Size.fromHeight(60),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'SourceCodePro',
        fontSize: 18,
        color: Colors.black,
      ),
    ),
  ),

  // TextButton theme
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: menuTextStyle,
      foregroundColor: blueThemePrimary200,
    ),
  ),

  // Divider theme
  dividerTheme: const DividerThemeData(
    color: blueThemePrimary100,
    thickness: 0.7,
  ),

  // SnackBar theme
  snackBarTheme: SnackBarThemeData(
    backgroundColor: blueThemePrimary300,
    contentTextStyle: snackbarTextStyle,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    behavior: SnackBarBehavior.floating,
  ),
);

// Custom text styles
const paragraphStyle = TextStyle(
  fontWeight: FontWeight.w300,
  fontFamily: 'SourceCodePro',
  fontSize: 16,
  color: Colors.white,
);

const smallTitleStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontFamily: 'SourceCodePro',
  fontSize: 20,
  color: Colors.white,
);

const priceStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontFamily: 'SourceCodePro',
  fontSize: 18,
  color: blueThemePrimary400,
);

const linkStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontFamily: 'SourceCodePro',
  fontSize: 18,
  color: blueThemePrimary,
);

const formLabelStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontFamily: 'SourceCodePro',
  fontSize: 16,
  color: blueThemePrimary300,
);

const snackbarTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontFamily: 'SourceCodePro',
  fontSize: 16,
  color: Colors.black,
);

const headerStyle = TextStyle(
  color: blueThemePrimary,
  fontSize: 28.0,
  fontWeight: FontWeight.w400,
  fontFamily: 'SourceCodePro',
);

const menuTextStyle = TextStyle(
  fontSize: 16.0,
  fontFamily: 'SourceCodePro',
  fontWeight: FontWeight.w300,
  color: blueThemePrimary400,
);

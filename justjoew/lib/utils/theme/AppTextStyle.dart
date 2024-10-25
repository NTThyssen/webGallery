import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/AppColors.dart';

class AppTextStyles {
  // Heading Styles (Montserrat)
  static final TextStyle headingLarge = TextStyle(
    color: Colors.white,
    fontSize: 32.0,
    fontWeight: FontWeight.w700, // Bold
    fontFamily: 'Montserrat',
  );

  static const pagetitle = TextStyle(
    fontFamily: 'Perpetua',
    fontWeight: FontWeight.w300, // Semi-bold for balanced emphasis
    fontSize: 32, // Medium size
    color:Colors.white, // Light grey for a softer contrast
    //letterSpacing: 1.3, // A bit more spacing for readability
    
  );

  static final TextStyle headingMedium = TextStyle(
    color: AppColors.primary,
    fontSize: 28.0,
    fontWeight: FontWeight.w600, // Semi-bold
    fontFamily: 'Montserrat',
  );

  static final TextStyle headingSmall = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.w600, // Semi-bold
    fontFamily: 'Montserrat',
  );

  // Body Text Styles (Open Sans)
  static final TextStyle bodyText = TextStyle(
    fontWeight: FontWeight.w300, // Regular weight for readability
    fontFamily: 'OpenSans',
    fontSize: 16, // Standard size for body text
    color: Colors.white,
    height: 1.6, // Increased line height for readability
  );

  static final TextStyle bodyTextBold = bodyText.copyWith(
    fontWeight: FontWeight.w600, // Bold for emphasis in body text
  );

  // List text style using Open Sans
  static final TextStyle listText = TextStyle(
    fontWeight: FontWeight.w300, // Regular weight
    fontFamily: 'OpenSans', // Open Sans for list items
    fontSize: 16, // Standard size for lists
    color: Colors.white, // Adjust based on your design
    height: 1.6, // Increased line height for readability
  );

  // Price or special highlighted text (Open Sans)
  static final TextStyle priceText = TextStyle(
    fontWeight: FontWeight.w400, // Regular weight
    fontFamily: 'OpenSans',
    fontSize: 18,
    color: AppColors.price,
  );

  // Interactive Text (Links, Buttons) (Montserrat)
  static final TextStyle linkText = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
    fontSize: 18,
    color: AppColors.link,
  );

  static final TextStyle buttonText = TextStyle(
    fontWeight: FontWeight.w600, // Semi-bold for button text
    fontFamily: 'Montserrat',
    fontSize: 16,
    color: Colors.black, // Ensure contrast with button background
  );

  // Miscellaneous Styles
  static final TextStyle formLabel = TextStyle(
    fontWeight: FontWeight.w400, // Regular weight
    fontFamily: 'OpenSans',
    fontSize: 14,
    color: AppColors.primary300,
  );

  static final TextStyle snackbarText = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
    fontSize: 16,
    color: AppColors.snackbarText,
  );
}

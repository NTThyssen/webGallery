import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart';
import 'package:justjoew/utils/theme/spacing.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: AppColors.primarySwatch, // Custom primarySwatch for consistency

  // Background color for the Scaffold
  scaffoldBackgroundColor: AppColors.background,

  // AppBar theme
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.background,
    iconTheme: IconThemeData(color: AppColors.primary),
    titleTextStyle: AppTextStyles.headingLarge, // Montserrat heading style
    elevation: 0.5
  ),

  // Text themes
  textTheme: TextTheme(
    bodyMedium: AppTextStyles.bodyText, // Open Sans for body text
    headlineMedium: AppTextStyles.headingSmall, // Small heading with Montserrat
    labelLarge: AppTextStyles.priceText, // Open Sans for price
    labelMedium: AppTextStyles.linkText, // Montserrat for links
    bodySmall: AppTextStyles.formLabel, // Open Sans for form labels
    labelSmall: AppTextStyles.snackbarText, // Open Sans for snackbar text
    headlineLarge: AppTextStyles.headingMedium, // Medium heading with Montserrat
    titleLarge: AppTextStyles.headingLarge, // Large heading with Montserrat
    displayMedium: AppTextStyles.bodyTextBold, // Bold body text for emphasis
    displaySmall: AppTextStyles.listText, // Open Sans for lists
  ),

  // Input decoration theme for text fields
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: AppTextStyles.formLabel,
    filled: true,
    fillColor: AppColors.formFill,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small),
      borderSide: BorderSide(color: AppColors.formFill),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small),
      borderSide: BorderSide(color: AppColors.primary200), // Slight contrast on enabled border
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small),
      borderSide: BorderSide(color: AppColors.primary900, width: 2.0), // Thicker border on focus
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small),
      borderSide: BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small),
      borderSide: BorderSide(color: AppColors.error, width: 2.0),
    ),
    hintStyle: AppTextStyles.formLabel.copyWith(color: AppColors.primary300), // Subtle hint text color
  ),

  // ElevatedButton theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return AppColors.primary400;
        }
        if (states.contains(MaterialState.pressed)) {
          return AppColors.primary600;
        }
        return AppColors.primary300;
      }),
      elevation: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return 10.0;
        }
        return 5.0;
      }),
      side: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return BorderSide(color: AppColors.primary200, width: 2.0); // Focus border
        }
        return BorderSide.none;
      }),
      textStyle: MaterialStateProperty.all(AppTextStyles.buttonText), // Ensure consistent button text style
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small), // Consistent border radius
        ),
      ),
    ),
  ),

  // TextButton theme
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return AppColors.primary500;
        }
        if (states.contains(MaterialState.focused)) {
          return AppColors.primary600;
        }
        return AppColors.primary300;
      }),
      textStyle: MaterialStateProperty.all(AppTextStyles.linkText), // Montserrat for link text
      overlayColor: MaterialStateProperty.all(AppColors.primary50.withOpacity(0.1)), // Subtle hover effect
    ),
  ),

  // Divider theme
  dividerTheme: DividerThemeData(
    color: AppColors.divider, // Slightly lower opacity for a subtle look
    thickness: 0.2,
    space: AppSpacing.medium, // Space around the divider for balance
  ),

  // SnackBar theme
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.primary300,
    contentTextStyle: AppTextStyles.snackbarText, // Open Sans for snackbars
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.medium),
    ),
    behavior: SnackBarBehavior.floating,
  ),
);

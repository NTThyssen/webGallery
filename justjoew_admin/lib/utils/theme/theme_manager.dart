import 'package:flutter/material.dart';
import 'package:justjoew_admin/utils/theme/AppColors.dart';
import 'package:justjoew_admin/utils/theme/AppTextStyle.dart';
import 'package:justjoew_admin/utils/theme/spacing.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: AppColors.primarySwatch, // Custom primarySwatch for consistency

  // Background color for the Scaffold
  scaffoldBackgroundColor: AppColors.background,

  // AppBar theme
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.background,
    iconTheme: const IconThemeData(color: AppColors.primary),
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
      borderSide: const BorderSide(color: AppColors.formFill),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small),
      borderSide: const BorderSide(color: AppColors.primary200), // Slight contrast on enabled border
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small),
      borderSide: const BorderSide(color: AppColors.primary900, width: 2.0), // Thicker border on focus
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small),
      borderSide: const BorderSide(color: AppColors.error, width: 2.0),
    ),
    hintStyle: AppTextStyles.formLabel.copyWith(color: AppColors.primary300), // Subtle hint text color
  ),

  // ElevatedButton theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered)) {
          return AppColors.primary400;
        }
        if (states.contains(WidgetState.pressed)) {
          return AppColors.primary600;
        }
        return AppColors.primary300;
      }),
      elevation: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered)) {
          return 10.0;
        }
        return 5.0;
      }),
      side: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return const BorderSide(color: AppColors.primary200, width: 2.0); // Focus border
        }
        return BorderSide.none;
      }),
      textStyle: WidgetStateProperty.all(AppTextStyles.buttonText), // Ensure consistent button text style
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small), // Consistent border radius
        ),
      ),
    ),
  ),

  // TextButton theme
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered)) {
          return AppColors.primary500;
        }
        if (states.contains(WidgetState.focused)) {
          return AppColors.primary600;
        }
        return AppColors.primary300;
      }),
      textStyle: WidgetStateProperty.all(AppTextStyles.linkText), // Montserrat for link text
      overlayColor: WidgetStateProperty.all(AppColors.primary50.withOpacity(0.1)), // Subtle hover effect
    ),
  ),

  // Divider theme
  dividerTheme: const DividerThemeData(
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

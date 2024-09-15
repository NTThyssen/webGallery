import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart';
import 'package:justjoew/utils/theme/spacing.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: Colors.lightBlue,

  // Background color for the Scaffold
  scaffoldBackgroundColor: AppColors.background,

  // AppBar theme
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.background,
    elevation: 1,
    iconTheme: IconThemeData(color: AppColors.primary400),
    toolbarHeight: 105,
    titleTextStyle: AppTextStyles.headerLarge,
  ),

  // Text themes
  textTheme: TextTheme(
    bodyMedium: AppTextStyles.paragraph,
    headlineMedium: AppTextStyles.smallTitle,
    labelLarge: AppTextStyles.price,
    labelMedium: AppTextStyles.link,
    bodySmall: AppTextStyles.formLabel,
    labelSmall: AppTextStyles.snackbarText,
    headlineLarge: AppTextStyles.header,
    titleLarge: AppTextStyles.headerLarge,
    displayMedium: AppTextStyles.subheader,
    displaySmall: AppTextStyles.list,
  ),

  // Input decoration theme for text fields
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: AppTextStyles.formLabel,
    filled: true,
    fillColor: AppColors.formFill,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small), // Use AppSpacing
      borderSide: BorderSide(color: AppColors.formFill),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small), // Use AppSpacing
      borderSide: BorderSide(color: AppColors.formFill),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small), // Use AppSpacing
      borderSide: BorderSide(color: AppColors.primary900),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small), // Use AppSpacing
      borderSide: BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small), // Use AppSpacing
      borderSide: BorderSide(color: AppColors.primary900),
    ),
    errorStyle: AppTextStyles.link,
  ),

  // ElevatedButton theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary300,
      minimumSize: Size.fromHeight(AppSpacing.large), // Use AppSpacing
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.medium), // Use AppSpacing
      ),
      textStyle: AppTextStyles.menuText,
    ),
  ),

  // TextButton theme
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: AppTextStyles.menuText,
      foregroundColor: AppColors.primary300,
    ),
  ),

  // Divider theme
  dividerTheme: DividerThemeData(
    color: AppColors.divider,
    thickness: 0.7,
  ),

  // SnackBar theme
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.primary300,
    contentTextStyle: AppTextStyles.snackbarText,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.medium), // Use AppSpacing
    ),
    behavior: SnackBarBehavior.floating,
  ),
);

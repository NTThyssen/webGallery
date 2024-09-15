import 'package:flutter/material.dart';

class AppSpacing {
  // General Spacing
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 32.0;
  static const double xl = 64.0;
  static const double xxl = 100.0;
  static const double xxxl = 200.0;

  // Screen size breakpoints
  static const double smallscreen = 600.0;

  // Padding and Margin
  static const EdgeInsets paddingSmall = EdgeInsets.all(small);
  static const EdgeInsets paddingMedium = EdgeInsets.all(medium);
  static const EdgeInsets paddingLarge = EdgeInsets.all(large);

  static const EdgeInsets marginSmall = EdgeInsets.all(small);
  static const EdgeInsets marginMedium = EdgeInsets.all(medium);
  static const EdgeInsets marginLarge = EdgeInsets.all(large);

  // Symmetric Padding
  static const EdgeInsets paddingHorizontalSmall = EdgeInsets.symmetric(horizontal: small);
  static const EdgeInsets paddingHorizontalMedium = EdgeInsets.symmetric(horizontal: medium);
  static const EdgeInsets paddingHorizontalLarge = EdgeInsets.symmetric(horizontal: large);

  static const EdgeInsets paddingVerticalSmall = EdgeInsets.symmetric(vertical: small);
  static const EdgeInsets paddingVerticalMedium = EdgeInsets.symmetric(vertical: medium);
  static const EdgeInsets paddingVerticalLarge = EdgeInsets.symmetric(vertical: large);
}

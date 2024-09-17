import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/spacing.dart';

class mainHeader extends StatelessWidget {
  final String text;
  final String? subheader;

  const mainHeader({super.key, required this.text, this.subheader});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust the font size based on screen width
    double fontSize;
    if (screenWidth < 400) {
      fontSize = 24.0; // Very small screens
    } else if (screenWidth < AppSpacing.smallscreen) {
      fontSize = 32.0; // Mobile
    } else {
      fontSize = 40.0; // Tablet and larger screens
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: fontSize, // Use dynamic font size
                  color: Colors.white, // Override color to always be white
                  shadows: [], // Remove drop shadows
                ),
          ),
          if (subheader != null)
            Text(
              subheader!,
              style: Theme.of(context).textTheme.displayMedium,
            ),
        ],
      );
  }
}

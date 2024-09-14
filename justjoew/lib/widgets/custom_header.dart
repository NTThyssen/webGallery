import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/spacing.dart';

class CustomHeaderLarge extends StatelessWidget {
  final String text;

  const CustomHeaderLarge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust the font size based on screen width
    double fontSize;
    if (screenWidth < 400) {
      fontSize = 30.0; // Very small screens
    } else if (screenWidth < 600) {
      fontSize = 40.0; // Mobile
    } else {
      fontSize = 50.0; // Tablet and larger screens
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.medium),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: fontSize, // Use dynamic font size
              color: Colors.white, // Override color to always be white
              shadows: [], // Remove drop shadows
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.medium), // Add spacing below the header
      ],
    );
  }
}

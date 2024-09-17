import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/spacing.dart';

class MainHeader extends StatelessWidget {
  final String text;
  final String? subheader;

  const MainHeader({super.key, required this.text, this.subheader});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust the font sizes based on screen width
    double fontSize;
    double subheaderFontSize;
    EdgeInsetsGeometry padding;

    if (screenWidth < 400) {
      fontSize = 24.0;
      subheaderFontSize = 16.0;
      padding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
    } else if (screenWidth < AppSpacing.smallscreen) {
      fontSize = 32.0;
      subheaderFontSize = 20.0;
      padding = EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0);
    } else {
      fontSize = 40.0;
      subheaderFontSize = 24.0;
      padding = EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0);
    }

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: fontSize,
                  color: Colors.white,
                  shadows: [],
                ),
            textAlign: TextAlign.center,
          ),
          if (subheader != null)
            SizedBox(height: 8.0), // Add some spacing between the header and subheader
          if (subheader != null)
            Text(
              subheader!,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: subheaderFontSize,
                    color: Colors.white70, // Slightly dimmed color for subheader
                  ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}

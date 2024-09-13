import 'package:flutter/material.dart';

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
      fontSize = 60.0; // Tablet and larger screens
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize, // Use dynamic font size
              fontWeight: FontWeight.w500,
              fontFamily: 'SourceCodePro',
            ),
          ),
        ),
        const SizedBox(height: 20.0), // Add spacing below the header
      ],
    );
  }
}

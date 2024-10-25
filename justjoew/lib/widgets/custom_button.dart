import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/AppColors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary, // Button background color from theme
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // Adjust padding for a more comfortable button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Slightly larger rounded corners
        ),
        elevation: 6, // Elevation for a subtle shadow effect
      ),
      onPressed: onPressed,
      child:SelectableText(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white, // White text to contrast with the background
              fontWeight: FontWeight.bold, // Bold text for emphasis
              fontSize: 16, // Slightly larger font size for readability
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:justjoew/mixins/SocialMediaBar.dart';
import 'package:justjoew/utils/theme/spacing.dart'; // Use AppSpacing for padding

class MyFooter extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const MyFooter({
    super.key,
    this.padding = const EdgeInsets.symmetric(vertical: AppSpacing.small), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width to cover the entire screen width
      padding: padding, // Use the padding parameter, adjustable from the caller
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor, // Ensure background matches the overall theme
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.3), // Optional: add a top border for separation
            width: 0.5,
          ),
        ),
      ),
      child: const Center(
        child: SocialMediaBar(), // Centers the social media bar horizontally
      ),
    );
  }
}

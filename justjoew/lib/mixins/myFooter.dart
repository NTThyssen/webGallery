import 'package:flutter/material.dart';
import 'package:justjoew/mixins/SocialMediaBar.dart';
import 'package:justjoew/utils/theme/spacing.dart'; // Use AppSpacing for padding

class MyFooter extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const MyFooter({
    super.key,
    this.padding = const EdgeInsets.symmetric(vertical: 0), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width
      padding: padding, // Use the padding parameter
      //color: Theme.of(context).scaffoldBackgroundColor, // Optional: Use theme color if needed
      child: const Center(
        child: SocialMediaBar(), // Centers the social media bar horizontally
      ),
    );
  }
}

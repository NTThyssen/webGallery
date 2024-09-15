import 'package:flutter/material.dart';
import 'package:justjoew/mixins/SocialMediaBar.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width
      padding: const EdgeInsets.symmetric(vertical: 16.0), // Optional: Adjust padding as needed
      child: const Center(
        child: SocialMediaBar(), // Centers the social media bar horizontally
      ),
    );
  }
}

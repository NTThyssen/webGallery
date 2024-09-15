import 'package:flutter/material.dart';
import 'package:justjoew/mixins/SocialMediaBar.dart';

class MyFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width
      padding: const EdgeInsets.symmetric(vertical: 16.0), // Optional: Adjust padding as needed
      child: Center(
        child: SocialMediaBar(), // Centers the social media bar horizontally
      ),
    );
  }
}

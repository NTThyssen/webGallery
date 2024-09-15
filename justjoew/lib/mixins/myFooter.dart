import 'package:flutter/material.dart';
import 'package:justjoew/mixins/SocialMediaBar.dart';

class MyFooter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Use double.infinity for full width
      height: 55,
      child: Center( // Simplify alignment with Center widget
        child: SocialMediaBar(), // Add the social media bar here
      ),
    );
  }
}

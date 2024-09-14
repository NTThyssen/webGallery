import 'package:flutter/material.dart';
import 'package:justjoew/mixins/SocialMediaBar.dart';

class myFooter extends StatelessWidget {
  static const Color _backgroundColor = Color(0xff212121); // Background color

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialMediaBar(), // Add the social media bar here
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomHeaderLarge extends StatelessWidget {
  final String text;

  const CustomHeaderLarge({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 60.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'SourceCodePro',
            ),
          ),
        ),
        SizedBox(height: 64.0), // Add spacing below the header
      ],
    );
  }
}

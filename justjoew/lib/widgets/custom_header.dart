import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/mainheader.dart';

class CustomHeaderLarge extends StatelessWidget {
  final String text;
  final String? subheader;

  const CustomHeaderLarge({super.key, required this.text, this.subheader});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen = screenWidth > AppSpacing.smallscreen;

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.large), // Adds padding at the top
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainHeader(text: text, subheader: subheader), // Use the mainHeader widget
          //if (isLargeScreen) const SizedBox(height: AppSpacing.large), // Conditionally add space for large screens
        ],
      ),
    );
  }
}

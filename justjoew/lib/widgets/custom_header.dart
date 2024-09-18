import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/mainheader.dart';

class CustomHeaderLarge extends StatelessWidget {
  final String text;
  final String? subheader;

  const CustomHeaderLarge({super.key, required this.text, this.subheader});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.large), // Adds padding at the top
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainHeader(text: text, subheader: subheader), // Use the mainHeader widget
          const SizedBox(height: AppSpacing.large), // Adds space below the header
        ],
      ),
    );
  }
}

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
      padding: const EdgeInsets.only(top: AppSpacing.large), // Add padding to the top only
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          mainHeader(text: text, subheader: subheader),
          const SizedBox(height: AppSpacing.large),
        ],
      ),
    );
  }
}

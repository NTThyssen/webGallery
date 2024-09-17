import 'package:flutter/material.dart';
import 'package:justjoew/constants/AppStrings.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/custom_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Define padding values for different screen sizes
    final EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(
      horizontal: screenWidth < AppSpacing.smallscreen ? screenWidth * 0.08 : screenWidth * 0.20,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: contentPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomHeaderLarge(
                text: AppStrings.appName,
                subheader: AppStrings.welcomeMessage,
              ),
              const SizedBox(height: AppSpacing.large),
              Text(
                AppStrings.introductionText,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.large),
              // Example button, now wrapped in a SizedBox
              SizedBox(
                width: 200, // Set a fixed width for the button
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50), // Adjust the height
                  ),
                  onPressed: () {
                    // Your button's onPressed logic
                  },
                  child: const Text('Get Started'),
                ),
              ),
              const SizedBox(height: AppSpacing.large),
              // Add other content or buttons as needed
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:justjoew/constants/ImageStrings.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/spacing.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with BasicMixin {
  // Define the image aspect ratio as a constant
  static const double _imageAspectRatio = 700 / 1800;

  @override
  Widget body() {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;
    // Check if the screen width is less than a threshold for small screens
    bool isSmallScreen = screenWidth < AppSpacing.smallscreen; // Example threshold for small screens

    // Determine container height based on the aspect ratio for large screens
    double containerHeight = isSmallScreen ? 450.0 : screenWidth * _imageAspectRatio;
    // Set container width for small screens to be screen width (cropping the image)
    double containerWidth = isSmallScreen ? screenWidth : screenWidth;

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(ImageStrings.landscapeImage), // Use centralized image path
          fit: isSmallScreen ? BoxFit.cover : BoxFit.fitWidth, // Cover for small screens, fitWidth for large screens
          alignment: Alignment.center, // Center the image
        ),
      ),
    );
  }
}

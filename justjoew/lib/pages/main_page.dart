import 'package:flutter/material.dart';
import 'package:justjoew/utils/constants/ImageStrings.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/spacing.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with BasicMixin {
  // Define aspect ratios for different screen sizes
  static const double largeImageAspectRatio = 700 / 1800; // Original ratio for desktop
  static const double smallImageAspectRatio = 1080 / 1920; // Adjusted for mobile portrait

  // Custom screen size thresholds
  static const double largeScreenThreshold = 1200; // Example threshold for large screens
  static const double smallScreenThreshold = 800;  // Example threshold for small screens

  // Minimum and maximum scaling limits for logo and text
  static const double minLogoScaleFactor = 0.15; // Minimum scale factor for large screens
  static const double maxLogoScaleFactor = 0.4;  // Maximum scale factor for smaller screens

  // Static size for logo and text on small screens
  static const double staticLogoSize = 150; // Static size for logo on small screens
  static const double staticTextSize = 100; // Static size for text on small screens

  // Ratio of JustJoew to Digital Artist size
  static const double logoToTextRatio = 1.5; // JustJoew logo is 1.5 smaller larger than Digital Artist text

  // Method to get the appropriate background image based on screen size
  String _getBackgroundImage(double screenWidth) {
    if (screenWidth < smallScreenThreshold) {
      return ImageStrings.smallLandscapeImage; // Small screen (mobile)
    } else if (screenWidth < largeScreenThreshold) {
      return ImageStrings.mediumLandscapeImage; // Medium screen (tablet)
    } else {
      return ImageStrings.largeLandscapeImage; // Large screen (desktop)
    }
  }

  // Method to get the appropriate profile image based on screen size
  String _getProfileImage(double screenWidth) {
    if (screenWidth < smallScreenThreshold) {
      return ImageStrings.profileImageSmall; // Small screen
    } else if (screenWidth < largeScreenThreshold) {
      return ImageStrings.profileImageMed; // Medium screen
    } else {
      return ImageStrings.profileImageLarge; // Large screen
    }
  }

  // Helper method for smooth scaling for larger screens
  double _dynamicScaleFactor(double screenWidth) {
    if (screenWidth >= largeScreenThreshold) {
      return screenWidth * minLogoScaleFactor; // Scale for large screens
    } else {
      // Calculate a smooth scale between static size and max scale based on screen width
      double dynamicScale = staticLogoSize + ((screenWidth - smallScreenThreshold) / (largeScreenThreshold - smallScreenThreshold)) * (maxLogoScaleFactor - minLogoScaleFactor);
      return dynamicScale;
    }
  }

  @override
  Widget body() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Access the AppBar height from the appBarTheme without defining it in the page
    final appBarTheme = Theme.of(context).appBarTheme;
    final double appBarHeight = appBarTheme.toolbarHeight ?? kToolbarHeight;

    // Define a fixed footer height
    double footerHeight = 58 + AppSpacing.small; // Assuming a fixed height for the footer

    // Calculate available height for the background image
    double availableHeight = screenHeight - appBarHeight - footerHeight;

    // Get appropriate background image for screen size
    String selectedImage = _getBackgroundImage(screenWidth);

    // Get appropriate profile image for screen size
    String profileImage = _getProfileImage(screenWidth);

    // Determine if screen is small
    bool isSmallScreen = screenWidth < smallScreenThreshold;

    // Calculate dynamic sizes for JustJoew and Digital Artist while maintaining ratio
    double dynamicLogoSize = isSmallScreen ? staticLogoSize : _dynamicScaleFactor(screenWidth);
    double dynamicTextSize = dynamicLogoSize * logoToTextRatio; // Ensure the ratio remains constant

    return Container(
      width: screenWidth,
      height: availableHeight, // Set height to available space between AppBar and Footer
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(selectedImage),
                  fit: BoxFit.cover, // Scale the image within the available space while keeping aspect ratio
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          // Overlay Butterfly Image (for decoration)
          Positioned(
            top: availableHeight * 0.03, // Position relative to available height
            left: screenWidth * 0.02, // Position relative to screen width
            child: Image.asset(
              ImageStrings.butterflies,
              width: screenWidth * 0.15, // Adjust butterfly size relative to screen
              height: screenWidth * 0.15,
            ),
          ),
          // Avatar Image (Scalable based on screen size)
          Positioned(
            bottom: 0, // Adjust the top padding as needed
            right: screenWidth * 0.05, // Adjust based on your layout preference
            child: Image.asset(
              profileImage, // Use the scalable profile image
              width: screenWidth * 0.2, // Scale avatar size relative to screen width
            ),
          ),
          // Center JustJoew and Digital Artist together
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // JustJoew Logo (Static on small screens, dynamic on large screens)
                Image.asset(
                  ImageStrings.logoPath,
                  width: dynamicLogoSize, // Adjust logo size
                ),
                SizedBox(height: 10), // Adjust the spacing between the logo and text
                // Digital Artist Text (Keep the ratio with JustJoew)
                Image.asset(
                  ImageStrings.digitalArtist,
                  width: dynamicTextSize, // Adjust text size based on logo size
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

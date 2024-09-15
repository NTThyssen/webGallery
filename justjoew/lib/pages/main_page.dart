import 'package:flutter/material.dart';
import 'package:justjoew/constants/ImageStrings.dart';
import 'package:justjoew/mixins/basic_mixin.dart';

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
    // Calculate the height based on the aspect ratio of the image
    double containerHeight = screenWidth * _imageAspectRatio;

    return Container(
      width: screenWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(Imagestrings.landscapeImage), // Use centralized image path
          fit: BoxFit.cover, // Fits the image within the container
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

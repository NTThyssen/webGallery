import 'package:flutter/material.dart';
import 'package:justjoew/mixins/basic_mixin.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with BasicMixin {
  @override
  Widget body() {
    print("body() method is called test");

    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;
    // Calculate the height based on the aspect ratio of the image (700 / 1800)
    double containerHeight = screenWidth * (700 / 1800);

    return Container(
      width: screenWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/land.png"),
          fit: BoxFit.cover, // Fits the image within the container
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

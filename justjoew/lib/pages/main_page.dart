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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/land.png"),
          fit: BoxFit.contain, // Maintains aspect ratio while filling width
          alignment: Alignment.topCenter, // Aligns the image to the top center
        ),
      ),
    );
  }
}

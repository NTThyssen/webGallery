import 'package:flutter/material.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
//import 'package:justjoew/mixins/scaffoldMixin.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with BasicMixin {
  @override
  Widget body() {
    print("body() method is called test");
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/land.png"),
          fit: BoxFit.contain, // Fills the width while maintaining the aspect ratio
          alignment: Alignment.topCenter, // Centers the image
        ),
      ),
    );
  }
}

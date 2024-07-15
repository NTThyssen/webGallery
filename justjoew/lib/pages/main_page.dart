import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:justjoew/mixins/scaffoldMixin.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with BasicMixin {
  @override
  Widget body() {
    print("body() method is called");
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 160,
      child: Image.asset(
        "images/land.png",
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

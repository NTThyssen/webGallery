import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_gallery/widgets/main_content.dart';
import 'package:project_gallery/widgets/sidebar.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SideBar(),
        Container(
          width: 100,
        ),
        SingleChildScrollView(child: MainContent())
      ],
    );
  }
}

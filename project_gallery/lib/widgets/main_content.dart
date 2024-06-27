import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_gallery/pages/design_page.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
      child: Column(
        children: [
          DesignPage(),
        ],
      ),
    );
  }
}

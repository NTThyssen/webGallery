import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:justjoew/pages/design_page.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.70,
                padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                child: DesignPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

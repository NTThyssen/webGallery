import 'package:flutter/material.dart';
import 'package:justjoew/mixins/scaffoldMixin.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> with BasicMixin {
  @override
  Widget body() {
    return const Center(
      child: Text(
        "About Page",
        style: TextStyle(color: Colors.lightBlue),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/pages/design_page.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> with BasicMixin {
  @override
  Widget body() {
    return Center(
      child: SingleChildScrollView( // Allows scrolling if content overflows
        child: Column(
          children: [
            SizedBox(
              child: const DesignPage(),
            ),
          ],
        ),
      ),
    );
  }
}

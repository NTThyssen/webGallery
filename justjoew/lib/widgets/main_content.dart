import 'package:flutter/material.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/pages/design_page.dart';
import 'package:justjoew/utils/theme/spacing.dart';

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
        padding: const EdgeInsets.all(0), // Optional padding for better layout
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.60,
              child: const DesignPage(),
            ),
          ],
        ),
      ),
    );
  }
}

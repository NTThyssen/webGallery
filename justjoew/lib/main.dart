import 'package:flutter/material.dart';
import 'package:justjoew/pages/main_page.dart';
import 'package:justjoew/utils/navigator/navigator.dart';
import 'package:justjoew/utils/theme/theme_manager.dart';

void main() {
  runApp(const MyInitApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just Joew',
      theme: myTheme,
      home: const MyHomePage(title: 'Just Joew'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //cool color Color(0xff212121),
  @override
  Widget build(BuildContext context) {
    return const MainPage();
  }
}

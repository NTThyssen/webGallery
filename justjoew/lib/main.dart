import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/mixins/scaffoldMixin.dart';
import 'package:justjoew/pages/main_page.dart';
import 'package:justjoew/utils/navigator/navigator.dart';
import 'package:justjoew/constants/costum_colors.dart';

void main() {
  runApp(const MyInitApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blueThemePrimary),
        useMaterial3: true,
      ),
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
    return MainPage();
  }
}

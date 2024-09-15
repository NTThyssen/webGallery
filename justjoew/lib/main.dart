import 'package:flutter/material.dart';
import 'package:justjoew/constants/AppStrings.dart';
import 'package:justjoew/pages/main_page.dart';
import 'package:justjoew/utils/navigator/navigator.dart';
import 'package:justjoew/utils/theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      theme: myTheme,
      routerConfig: AppRouter.router, // Ensure the routerConfig is used
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
  @override
  Widget build(BuildContext context) {
    return const MainPage(); // Keep MainPage encapsulated if further optimizations are not needed here
  }
}

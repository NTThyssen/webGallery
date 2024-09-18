import 'package:flutter/material.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/utils/navigator/navigator.dart'; // Make sure AppRouter is correctly defined
import 'package:justjoew/utils/theme/theme_manager.dart';
import 'package:flutter/services.dart';


void main() {
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // Set the desired color
    systemNavigationBarIconBrightness: Brightness.light, // Choose icon brightness
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      theme: myTheme,
      routerConfig: AppRouter.router, // Ensure this is correctly configured
    );
  }
}

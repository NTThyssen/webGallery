import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/main.dart';
import 'package:justjoew/pages/about_me_page.dart';
import 'package:justjoew/pages/comissions_page.dart';
import 'package:justjoew/pages/contact_page.dart';
import 'package:justjoew/utils/theme/theme_manager.dart';
import 'package:justjoew/widgets/main_content.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: ROOT_PATH,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const MyApp(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child; // No animation
        },
      ),
    ),
    GoRoute(
      path: PORTFOLIO_PATH,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const MainContent(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child; // No animation
        },
      ),
    ),
    GoRoute(
      path: CONTACT_PATH,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const ContactPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child; // No animation
        },
      ),
    ),
    GoRoute(
      path: COMMISSIONS_PATH, // Corrected path name
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const CommissionPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child; // No animation
        },
      ),
    ),
    GoRoute(
      path: ABOUT_PATH,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const AboutMePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child; // No animation
        },
      ),
    ),
  ],
);

class MyInitApp extends StatelessWidget {
  const MyInitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: myTheme, // Apply the custom theme here
    );
  }
}

// Path constants
const String ROOT_PATH = "/";
const String PORTFOLIO_PATH = "/portfolio"; // Consider keeping paths lowercase
const String ABOUT_PATH = "/aboutme";
const String CONTACT_PATH = "/contacts";
const String COMMISSIONS_PATH = "/commissions"; // Corrected spelling

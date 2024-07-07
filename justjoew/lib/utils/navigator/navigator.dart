import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/main.dart';
import 'package:justjoew/widgets/main_content.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
        path: ROOT_PATH,
        pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const MyApp(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child; // No animation
              },
            )),
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
  ],
);

class MyInitApp extends StatelessWidget {
  const MyInitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

const String ROOT_PATH = "/";
const String PORTFOLIO_PATH = "/PORTFOLIO";

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/pages/about_me_page.dart';
import 'package:justjoew/pages/comissions_page.dart';
import 'package:justjoew/pages/contact_page.dart';
import 'package:justjoew/pages/faq.dart';
import 'package:justjoew/pages/main_page.dart';
import 'package:justjoew/pages/policy_page.dart';
import 'package:justjoew/pages/terms.dart';
import 'package:justjoew/pages/usageLicens_page.dart';
import 'package:justjoew/pages/willdoes_page.dart';
import 'package:justjoew/widgets/main_content.dart';

// Path constants
class AppRoutes {
  static const String root = "/";
  static const String portfolio = "/portfolio";
  static const String about = "/aboutme";
  static const String contact = "/contacts";
  static const String commissions = "/commissions";
  static const String faq = "/faq";
  static const String terms = "/terms";
  static const String policies = "/policies";
  static const String usage = "/usagelicense";
  static const String willdo = "/doanddont";
}

// Router configuration class
class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.root,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MainPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child; // No animation
          },
          transitionDuration: Duration.zero, // No animation duration
        ),
      ),
      GoRoute(
        path: AppRoutes.portfolio,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MainContent(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child; // No animation
          },
          transitionDuration: Duration.zero,
        ),
      ),
      GoRoute(
        path: AppRoutes.contact,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ContactPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child; // No animation
          },
          transitionDuration: Duration.zero,
        ),
      ),
      GoRoute(
        path: AppRoutes.commissions,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const CommissionPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child; // No animation
          },
          transitionDuration: Duration.zero,
        ),
      ),
      GoRoute(
        path: AppRoutes.about,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AboutMePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child; // No animation
          },
          transitionDuration: Duration.zero,
        ),
      ),
      GoRoute(
        path: AppRoutes.faq,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const FaqPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child; // No animation
          },
          transitionDuration: Duration.zero,
        ),
      ),
      GoRoute(
        path: AppRoutes.terms,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TermsPoliciesPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child; // No animation
          },
          transitionDuration: Duration.zero,
        ),
      ),
      GoRoute(
        path: AppRoutes.usage,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const UsagelicensPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child; // No animation
          },
          transitionDuration: Duration.zero,
        ),
      ),
      GoRoute(
        path: AppRoutes.policies,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const PolicyPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child; // No animation
          },
          transitionDuration: Duration.zero,
        ),
      ),
      GoRoute(
        path: AppRoutes.willdo,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const WilldoesPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child; // No animation
          },
          transitionDuration: Duration.zero,
        ),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri.path}'),
      ),
    ),
  );
}


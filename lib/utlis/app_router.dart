import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile_barsh_web/app_layout.dart';
import '../pages/about_page.dart';
import '../pages/home_page.dart';
import 'package:flutter/material.dart';

import '../pages/services_page.dart';

class AppRoutes {

  static const String home = '/';
  static const String about = '/about';
  static const String service = '/service'; // dynamic param
}

class AppRouter {

  // Singleton
  AppRouter._private();
  static final AppRouter instance = AppRouter._private();

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [

      //
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) =>AppLayout(child:  const HomePage()),
      ),
      GoRoute(
        path: AppRoutes.about,
        builder: (context, state) => AppLayout(child: const AboutPage()),

      ),
      GoRoute(
        path: AppRoutes.service,
        builder: (context, state) =>AppLayout(child:  HomeShell()),
      ),
    ],
    // errorBuilder: (context, state) => const ErrorScreen(),
  );

  // Navigation helpers
  void goTo(BuildContext context, String route) {
    router.go(route);
  }

  void push(BuildContext context, String route) {
    router.push(route);
  }

  void goBack(BuildContext context) {
    if (router.canPop()) router.pop();
  }
}

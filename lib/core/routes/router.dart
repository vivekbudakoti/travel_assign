import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_assign/features/experience/view/experience_detail_screen.dart';
import 'package:travel_assign/features/experience/view/experience_screen.dart';
import 'package:travel_assign/features/saved_experiences/view/saved_experiences_screen.dart';
import 'package:travel_assign/features/onboarding/view/interest_screen.dart';
import 'package:travel_assign/features/onboarding/view/splash_screen.dart';

class AppRouter {
  AppRouter._internal();

  static final AppRouter _instance = AppRouter._internal();

  factory AppRouter() => _instance;

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: SplashScreen.routeName,
    routes: [
      GoRoute(path: SplashScreen.routeName, builder: (context, state) => const SplashScreen()),
      GoRoute(path: InterestScreen.routeName, builder: (context, state) => InterestScreen()),
      GoRoute(path: SavedExperiencesScreen.routeName, builder: (context, state) => const SavedExperiencesScreen()),
      GoRoute(path: ExperienceScreen.routeName, builder: (context, state) => const ExperienceScreen()),
      GoRoute(
        path: ExperienceDetailScreen.routeName,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            child: const ExperienceDetailScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final curved = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
              return FadeTransition(opacity: curved, child: child);
            },
          );
        },
      ),
    ],
  );
}

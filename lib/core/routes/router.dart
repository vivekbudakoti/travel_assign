import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_assign/modules/experience_details/view/experience_detail_screen.dart';
import 'package:travel_assign/modules/experience/view/experience_screen.dart';
import 'package:travel_assign/modules/saved_experiences/view/saved_experiences_screen.dart';
import 'package:travel_assign/modules/onboarding/view/onboarding_screen.dart';
import 'package:travel_assign/modules/splash/splash_screen.dart';

class AppRouter {
  AppRouter._internal();

  static final AppRouter _instance = AppRouter._internal();

  factory AppRouter() => _instance;

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: SplashScreen.routeName,
    routes: [
      GoRoute(path: SplashScreen.routeName, builder: (context, state) => const SplashScreen()),
      GoRoute(path: OnboardingScreen.routeName, builder: (context, state) => OnboardingScreen()),
      GoRoute(
        path: SavedExperiencesScreen.routeName,
        builder: (context, state) => SavedExperiencesScreen(extra: state.extra),
      ),
      GoRoute(path: ExperienceScreen.routeName, builder: (context, state) => const ExperienceScreen()),
      GoRoute(
        path: "${ExperienceDetailScreen.routeName}/:id",
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            child: ExperienceDetailScreen(id: id, extra: state.extra),
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

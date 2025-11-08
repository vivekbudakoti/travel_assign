import 'package:go_router/go_router.dart';
import 'package:travel_assign/features/experience/view/experience_screen.dart';
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
      GoRoute(path: InterestScreen.routeName, builder: (context, state) => const InterestScreen()),
      GoRoute(path: ExperienceScreen.routeName, builder: (context, state) => const ExperienceScreen()),
    ],
  );
}

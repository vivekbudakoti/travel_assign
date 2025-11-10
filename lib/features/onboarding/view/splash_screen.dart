import 'package:flutter/material.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/routes/router.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/app_name.dart';
import 'package:travel_assign/core/widgets/asset_image.dart';
import 'package:travel_assign/features/onboarding/view/interest_screen.dart';
import 'package:travel_assign/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static final routeName = AppRoutes.splashScreen;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 2), () {
      AppRouter.router.pushReplacement(InterestScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundColor: context.colorScheme.surface,
              child: AppAssetImage(imagePath: Assets.icons.appLogo, height: 80, width: 80),
            ),
            10.verticalSizedBox,
            AppName(),
          ],
        ),
      ),
    );
  }
}

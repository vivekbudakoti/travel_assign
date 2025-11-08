import 'package:flutter/material.dart';
import 'package:travel_assign/core/widgets/asset_image.dart';
import 'package:travel_assign/gen/assets.gen.dart';
import 'package:travel_assign/l10n/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppAssetImage(imagePath: Assets.icons.appLogo, height: 80, width: 80),
            Text(l10n.appTitle),
          ],
        ),
      ),
    );
  }
}

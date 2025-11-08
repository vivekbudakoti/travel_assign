import 'package:flutter/material.dart';
import 'package:travel_assign/core/style/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/asset_image.dart';
import 'package:travel_assign/gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(context.l10n.travel, style: context.textTheme.headlineMedium),
                4.horizontalSizedBox,
                Text(
                  context.l10n.assign,
                  style: context.textTheme.headlineMedium?.copyWith(color: AppColors.secondaryText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

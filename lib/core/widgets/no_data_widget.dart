import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/asset_image.dart';
import 'package:travel_assign/gen/assets.gen.dart';

class NoDataWidget extends StatelessWidget {
  final String title;
  final String? subTitle;

  const NoDataWidget({super.key, required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: context.theme.colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAssetImage(imagePath: Assets.icons.noData, height: 100),
            12.verticalSizedBox,
            Text(title, style: context.textTheme.headlineMedium),
            2.verticalSizedBox,
            if (subTitle != null && subTitle?.isNotEmpty == true)
              Text(
                subTitle!,
                style: context.textTheme.bodySmall?.copyWith(color: AppColors.graniteGray),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}

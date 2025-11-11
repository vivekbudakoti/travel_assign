import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/asset_image.dart';
import 'package:travel_assign/core/widgets/button.dart';
import 'package:travel_assign/gen/assets.gen.dart';

class PlaceHolderStateWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool isError;
  final VoidCallback? onTap;

  const PlaceHolderStateWidget({super.key, required this.title, this.subTitle, this.isError = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: context.theme.colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (isError) ? Icon(Icons.error, size: 80) : AppAssetImage(imagePath: Assets.icons.noData, height: 100),
            12.verticalSizedBox,
            Text(title, style: context.textTheme.headlineMedium),
            2.verticalSizedBox,
            if (subTitle != null && subTitle?.isNotEmpty == true)
              Text(
                subTitle!,
                style: context.textTheme.bodySmall?.copyWith(color: AppColors.graniteGray),
                textAlign: TextAlign.center,
              ),
            if (onTap != null) 12.verticalSizedBox,
            if (onTap != null) AppButton(text: context.l10n.retry, onPressed: onTap ?? () {}),
          ],
        ),
      ),
    );
  }
}

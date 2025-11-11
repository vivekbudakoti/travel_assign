import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';

class AppName extends StatelessWidget {
  final bool isLarge;

  const AppName({super.key, this.isLarge = true});

  @override
  Widget build(BuildContext context) {
    final baseStyle = isLarge ? context.textTheme.headlineMedium : context.textTheme.headlineSmall;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(context.l10n.travel, style: baseStyle),
        4.horizontalSizedBox,
        Text(context.l10n.assign, style: baseStyle?.copyWith(color: AppColors.secondaryText)),
      ],
    );
  }
}

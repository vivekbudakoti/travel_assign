import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/features/experience/view/widgets/transluent_circle_avatar.dart';

class CircularHeart extends StatelessWidget {
  final bool? isFilled;
  final VoidCallback? onTap;
  const CircularHeart({super.key, this.isFilled = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TransluentCircleAvatar(
      onTap: onTap,
      child: Icon(
        isFilled == true ? Icons.favorite_rounded : Icons.favorite_outline,
        color: isFilled == true ? AppColors.secondaryText : context.colorScheme.onTertiary,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';

class CircularHeart extends StatelessWidget {
  final bool? isFilled;
  final VoidCallback? onTap;
  const CircularHeart({super.key, this.isFilled = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 12, right: 12),
        child: CircleAvatar(
          backgroundColor: context.colorScheme.primary.withValues(alpha: .7),
          radius: 16,
          child: Icon(
            isFilled == true ? Icons.favorite_rounded : Icons.favorite_outline,
            color: isFilled == true ? AppColors.secondaryText : context.colorScheme.onTertiary,
          ),
        ),
      ),
    );
  }
}

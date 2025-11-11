import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';

class AppCircleButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final IconData? icon;
  final bool isTranslucent;

  const AppCircleButton({super.key, this.onTap, this.child, this.icon, this.isTranslucent = false});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isTranslucent ? context.colorScheme.primary.withValues(alpha: .7) : AppColors.white;

    final Color iconColor = isTranslucent ? Colors.white : AppColors.primaryDark;

    return Padding(
      padding: isTranslucent ? const EdgeInsets.only(top: 12, right: 12) : EdgeInsets.zero,
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(isTranslucent ? 8.0 : 6.0),
            child: child ?? Icon(icon, color: iconColor, size: 22),
          ),
        ),
      ),
    );
  }
}

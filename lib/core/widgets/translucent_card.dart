import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';

class TransluentCard extends StatelessWidget {
  final Widget child;
  final bool? takeFullWidth;
  final EdgeInsets? padding;
  const TransluentCard({super.key, required this.child, this.takeFullWidth = true, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding ?? const EdgeInsets.symmetric(horizontal: 4),
      width: takeFullWidth == true ? double.maxFinite : null,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(color: AppColors.primaryDarkWithAlpha30, borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }
}

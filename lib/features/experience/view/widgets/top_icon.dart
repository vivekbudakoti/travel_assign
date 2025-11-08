import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';

class TopIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;

  const TopIcon({super.key, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: 16,
        child: Icon(icon, color: AppColors.primaryDark, size: 22),
      ),
    );
  }
}

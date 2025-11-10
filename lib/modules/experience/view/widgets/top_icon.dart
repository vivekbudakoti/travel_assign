import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';

class TopIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;

  const TopIcon({super.key, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(icon, color: AppColors.primaryDark, size: 22),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_assign/core/widgets/app_circular_button.dart';

class TopIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;

  const TopIcon({super.key, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AppCircleButton(onTap: onTap, icon: icon, isTranslucent: false);
  }
}

import 'package:flutter/material.dart';
import 'package:travel_assign/core/widgets/app_circular_button.dart';

class TransluentCircleAvatar extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  const TransluentCircleAvatar({super.key, this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppCircleButton(onTap: onTap, isTranslucent: true, child: child);
  }
}

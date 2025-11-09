import 'package:flutter/material.dart';

import 'package:travel_assign/core/utils/extension.dart';

class TransluentCircleAvatar extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  const TransluentCircleAvatar({super.key, this.onTap, required this.child});

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
          child: child,
        ),
      ),
    );
  }
}

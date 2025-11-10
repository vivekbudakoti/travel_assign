import 'package:flutter/material.dart';

import 'package:travel_assign/core/utils/extension.dart';

class TransluentCircleAvatar extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  const TransluentCircleAvatar({super.key, this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 12),
      child: Material(
        color: context.colorScheme.primary.withValues(alpha: .7),
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Padding(padding: const EdgeInsets.all(8.0), child: child),
        ),
      ),
    );
  }
}

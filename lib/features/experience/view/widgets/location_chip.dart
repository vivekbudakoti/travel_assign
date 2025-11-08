import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/extension.dart';

class LocationChip extends StatelessWidget {
  final String location;
  const LocationChip({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12, left: 12),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on, size: 14),
          2.horizontalSizedBox,
          Text(location, style: context.textTheme.bodySmall),
        ],
      ),
    );
  }
}

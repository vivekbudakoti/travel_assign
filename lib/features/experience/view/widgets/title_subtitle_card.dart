import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/features/experience/view/widgets/translucent_card.dart';

class TitleSubtitleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const TitleSubtitleCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return TransluentCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textTheme.titleLarge?.copyWith(color: AppColors.white)),
          2.verticalSizedBox,
          Text(
            subtitle,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodySmall?.copyWith(color: AppColors.white),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

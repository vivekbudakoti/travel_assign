import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/features/experience/view/widgets/title_subtitle_card.dart';
import 'package:travel_assign/features/experience/view/widgets/translucent_card.dart';

class ExperienceCardFooter extends StatelessWidget {
  final String topTileTitle;
  final String bottomTileTitle;
  final String bottomTileSubText;
  const ExperienceCardFooter({
    super.key,
    required this.topTileTitle,
    required this.bottomTileTitle,
    required this.bottomTileSubText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TransluentCard(
          takeFullWidth: false,
          child: Text(topTileTitle, style: context.textTheme.bodySmall?.copyWith(color: AppColors.white)),
        ),
        4.verticalSizedBox,
        TitleSubtitleCard(title: bottomTileTitle, subtitle: bottomTileSubText),
        4.verticalSizedBox,
      ],
    );
  }
}

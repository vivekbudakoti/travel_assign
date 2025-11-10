import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/features/experience/view/widgets/interests_list_tiles.dart';
import 'package:travel_assign/features/experience/view/widgets/title_subtitle_card.dart';

class ExperienceCardFooter extends StatelessWidget {
  final List<String> interests;
  final String bottomTileTitle;
  final String bottomTileSubText;
  final String expId;
  const ExperienceCardFooter({
    super.key,
    required this.interests,
    required this.bottomTileTitle,
    required this.bottomTileSubText,
    required this.expId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InterestsListTiles(interests: interests, expId: expId),
        4.verticalSizedBox,
        TitleSubtitleCard(title: bottomTileTitle, subtitle: bottomTileSubText),
        4.verticalSizedBox,
      ],
    );
  }
}

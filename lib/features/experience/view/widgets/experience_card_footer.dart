import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/features/experience/view/widgets/title_subtitle_card.dart';
import 'package:travel_assign/core/widgets/translucent_card.dart';

class ExperienceCardFooter extends StatelessWidget {
  final List<String> interests;
  final String bottomTileTitle;
  final String bottomTileSubText;
  const ExperienceCardFooter({
    super.key,
    required this.interests,
    required this.bottomTileTitle,
    required this.bottomTileSubText,
  });
  bool get _countIsGreaterThanThree => interests.length > 3;
  int get _interestLenght => interests.length;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Wrap(
            children: List.generate(_countIsGreaterThanThree ? 4 : _interestLenght, (index) {
              return TransluentCard(
                padding: const EdgeInsets.only(right: 4),
                takeFullWidth: false,
                child: Text(
                  (index == 3) ? "+${interests.length - 3}" : interests[index],
                  style: context.textTheme.bodySmall?.copyWith(color: AppColors.white),
                ),
              );
            }),
          ),
        ),
        4.verticalSizedBox,
        TitleSubtitleCard(title: bottomTileTitle, subtitle: bottomTileSubText),
        4.verticalSizedBox,
      ],
    );
  }
}

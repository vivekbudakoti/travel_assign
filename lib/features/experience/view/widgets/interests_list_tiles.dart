import 'package:flutter/widgets.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/translucent_card.dart';

class InterestsListTiles extends StatelessWidget {
  final List<String> interests;
  const InterestsListTiles({super.key, required this.interests});
  bool get _countIsGreaterThanThree => interests.length > 3;
  int get _interestLenght => interests.length;
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/modules/experience/view/widgets/location_chip.dart';

class ExperienceDetailsHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final String location;

  const ExperienceDetailsHeader({super.key, required this.title, required this.subTitle, required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.headlineMedium),
        2.verticalSizedBox,

        Text(subTitle, style: context.textTheme.bodyMedium?.copyWith(color: AppColors.graniteGray)),
        2.verticalSizedBox,
        Row(
          children: [
            Text("Location:", style: context.textTheme.bodySmall),
            4.horizontalSizedBox,
            LocationChip(location: location, margin: EdgeInsets.zero, padding: EdgeInsets.zero),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/common.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/model/experience_data_model.dart';
import 'package:travel_assign/modules/experience/view/widgets/experience_card.dart';

class ExperienceGridview extends StatelessWidget {
  final List<ExperienceDataModel> experienceData;
  final Function(ExperienceDataModel data)? onTapCard;
  final EdgeInsets? padding;
  final void Function()? onHeratTapCallBack;
  final bool showTutorial;
  final VoidCallback? onAnimationComplete;

  const ExperienceGridview({
    super.key,
    required this.experienceData,
    this.onTapCard,
    this.padding,
    this.onHeratTapCallBack,
    this.showTutorial = false,
    this.onAnimationComplete,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding ?? EdgeInsets.only(left: 16, right: 16, bottom: context.viewPadding.bottom + 16),
      gridDelegate: CommonUtil.experienceGridDelegate,
      itemCount: experienceData.length,
      itemBuilder: (context, index) {
        final data = experienceData[index];
        return ExperienceCard(
          onAnimationComplete: onAnimationComplete,
          data: data,
          showTutorial: (showTutorial) ? index == 0 : false,
          onHeratTapCallBack: onHeratTapCallBack,
          onTap: () {
            onTapCard?.call(data);
          },
        );
      },
    );
  }
}

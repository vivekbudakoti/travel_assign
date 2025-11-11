
import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/modules/experience/view/widgets/interest_option.dart';
import 'package:travel_assign/core/model/interests_model.dart';

class ExperienceScreenInterestList extends StatelessWidget {
  final List<InterestsModel> dataModel;
   final Function(InterestsModel data) onTapListItem;
  const ExperienceScreenInterestList({super.key, required this.dataModel, required this.onTapListItem});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final data = dataModel[index];
        return InterestOption(
          imageUrl: data.imageUrl ?? "",
          isSelected: data.isSelected,
          title: data.title ?? "",
          onTap: () {
            onTapListItem.call(data);
          },
        );
      },
      separatorBuilder: (context, index) => 10.horizontalSizedBox,
      itemCount: dataModel.length,
    );
  }
}

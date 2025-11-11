import 'package:flutter/material.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/utils/common.dart';
import 'package:travel_assign/modules/onboarding/model/interests_model.dart';
import 'package:travel_assign/modules/onboarding/view/widgets/intrerest_card.dart';

class InterestGridview extends StatelessWidget {
  final List<InterestsModel> interestsData;
  final void Function(InterestsModel interestData) onTapinterest;
  const InterestGridview({super.key, required this.interestsData, required this.onTapinterest});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Hero(
        tag: HeroConstants.interestGrid,
        child: GridView.builder(
          padding: EdgeInsets.only(bottom: 100),
          gridDelegate: CommonUtil.interestsGridDelegate,
          itemCount: interestsData.length,
          itemBuilder: (context, index) {
            final data = interestsData[index];
            return IntrerestCard(
              title: data.title ?? "",
              imageUrl: data.imageUrl ?? "",
              isSelected: data.isSelected,
              onTap: () {
                onTapinterest.call(data);
              },
            );
          },
        ),
      ),
    );
  }
}

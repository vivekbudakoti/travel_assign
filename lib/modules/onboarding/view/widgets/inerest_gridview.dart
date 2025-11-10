import 'package:flutter/material.dart';
import 'package:travel_assign/modules/onboarding/model/interests_model.dart';
import 'package:travel_assign/modules/onboarding/view/widgets/intrerest_card.dart';

class InerestGridview extends StatelessWidget {
  final List<InterestsModel> interestsData;
  final void Function(InterestsModel interestData) onTapinterest;
  const InerestGridview({super.key, required this.interestsData, required this.onTapinterest});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(bottom: 100),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
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
    );
  }
}

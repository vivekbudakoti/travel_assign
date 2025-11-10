import 'package:flutter/material.dart';
import 'package:travel_assign/modules/experience/view/widgets/interest_option.dart';
import 'package:travel_assign/modules/onboarding/model/interests_model.dart';

class InterestsRow extends StatelessWidget {
  final List<InterestsModel> data;
  final String expId;
  const InterestsRow({super.key, required this.data, required this.expId});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        data.length,
        (index) => Container(
          padding: EdgeInsets.only(right: 8),
          child: Hero(
            tag: ((data[index].title ?? "") + expId),
            child: InterestOption(
              imageUrl: data[index].imageUrl ?? "",
              isSelected: false,
              onTap: () {},
              title: data[index].title ?? "",
            ),
          ),
        ),
      ),
    );
  }
}

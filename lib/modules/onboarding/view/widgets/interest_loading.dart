import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/common.dart';
import 'package:travel_assign/core/widgets/shimmer_container.dart';

class InterestLoading extends StatelessWidget {
  const InterestLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 100),
      shrinkWrap: true,
      gridDelegate: CommonUtil.interestsGridDelegate,
      itemCount: 6,
      itemBuilder: (context, index) {
        return ShimmerContainer(height: double.infinity, width: double.infinity);
      },
    );
  }
}

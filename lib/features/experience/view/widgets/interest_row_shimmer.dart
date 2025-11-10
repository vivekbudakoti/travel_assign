import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/shimmer_container.dart';

class InterestRowShimmer extends StatelessWidget {
  const InterestRowShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return const ShimmerContainer(height: 70, width: 80, borderRadius: 50);
      },
      separatorBuilder: (context, index) => 10.horizontalSizedBox,
      itemCount: 6,
    );
  }
}

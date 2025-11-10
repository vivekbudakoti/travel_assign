import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/common.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/shimmer_container.dart';

class ExperienceListShimmer extends StatelessWidget {
  const ExperienceListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: context.viewPadding.bottom + 16),
        gridDelegate: CommonUtil.experienceGridDelegate,
        itemCount: 4,
        itemBuilder: (context, index) {
          return const ShimmerContainer(height: 200, width: double.infinity, borderRadius: 16);
        },
      ),
    );
  }
}

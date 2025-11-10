import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/widgets/shimmer_container.dart';

class ExperienceDetailsSheetShimmer extends StatelessWidget {
  final double heightBgImage;
  const ExperienceDetailsSheetShimmer({super.key, required this.heightBgImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: heightBgImage - 100),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShimmerContainer(width: 200, height: 20),
              8.verticalSizedBox,
              const ShimmerContainer(width: 150, height: 16),
              8.verticalSizedBox,
              const ShimmerContainer(width: 100, height: 14),
              16.verticalSizedBox,
              Divider(color: AppColors.secondaryText.withValues(alpha: 0.2)),
              const ShimmerContainer(width: 180, height: 18),
              8.verticalSizedBox,
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(4, (index) => const ShimmerContainer(width: 70, height: 30, borderRadius: 16)),
              ),
              12.verticalSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: ShimmerContainer(width: double.infinity, height: 14, borderRadius: 4),
                  ),
                ),
              ),
              context.viewPadding.bottom.verticalSizedBox,
            ],
          ),
        ),
      ],
    );
  }
}

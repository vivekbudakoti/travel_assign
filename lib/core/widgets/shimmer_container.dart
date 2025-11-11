import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_assign/core/theme/colors.dart';

class ShimmerContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  const ShimmerContainer({super.key, this.width, this.height, this.borderRadius = 8});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey.withValues(alpha: 0.3),
      highlightColor: AppColors.grey.withValues(alpha: 0.1),
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 200,
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

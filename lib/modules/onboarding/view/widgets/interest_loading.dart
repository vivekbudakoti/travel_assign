import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/shimmer_container.dart';

class InterestLoading extends StatelessWidget {
  const InterestLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: context.viewPadding.bottom),
        child: ShimmerContainer(height: 60, width: double.infinity),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.viewPadding.top.verticalSizedBox,
            20.verticalSizedBox,
            ShimmerContainer(height: 32, width: 200),
            4.verticalSizedBox,
            ShimmerContainer(height: 16, width: 250),
            16.verticalSizedBox,
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 100),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ShimmerContainer(height: double.infinity, width: double.infinity);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

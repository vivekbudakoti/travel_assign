import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/button.dart';

class OnboardingBottom extends StatelessWidget {
  final VoidCallback onContinue;
  final bool isDisabled;
  final String lable;

  const OnboardingBottom({super.key, required this.onContinue, this.isDisabled = false, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          16.verticalSizedBox,
          AppButton(text: lable, onPressed: onContinue, width: double.maxFinite, isDisabled: isDisabled),
        ],
      ),
    );
  }
}

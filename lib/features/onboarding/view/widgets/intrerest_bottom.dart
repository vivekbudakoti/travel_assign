import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/button.dart';

class IntrerestBottom extends StatelessWidget {
  final VoidCallback onContinue;
  const IntrerestBottom({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          16.verticalSizedBox,
          AppButton(text: context.l10n.continue_text, onPressed: onContinue, width: double.maxFinite),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/utils/extension.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  static final routeName = AppRoutes.interestScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            context.viewPadding.top.verticalSizedBox,
            Text("Select your intrests", style: context.textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/utils/extension.dart';

class SavedExperiencesScreen extends StatefulWidget {
  const SavedExperiencesScreen({super.key});
  static final String routeName = AppRoutes.savedExperiencesScreen;
  @override
  State<SavedExperiencesScreen> createState() => _SavedExperiencesScreenState();
}

class _SavedExperiencesScreenState extends State<SavedExperiencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            context.viewPadding.top.verticalSizedBox,
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                16.horizontalSizedBox,
                Text("Saved Experiences", style: context.textTheme.headlineSmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

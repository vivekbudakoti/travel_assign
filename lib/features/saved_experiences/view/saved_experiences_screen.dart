import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/utils/common.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/asset_image.dart';
import 'package:travel_assign/core/widgets/no_data_widget.dart';
import 'package:travel_assign/core/widgets/shimmer_container.dart';
import 'package:travel_assign/features/experience_details/view/experience_detail_screen.dart';
import 'package:travel_assign/features/experience/view/widgets/experience_card.dart';
import 'package:travel_assign/features/saved_experiences/bloc/saved_eperience_states.dart';
import 'package:travel_assign/features/saved_experiences/bloc/saved_experience_cubit.dart';
import 'package:travel_assign/gen/assets.gen.dart';

class SavedExperiencesScreen extends StatefulWidget {
  const SavedExperiencesScreen({super.key});
  static final String routeName = AppRoutes.savedExperiencesScreen;
  @override
  State<SavedExperiencesScreen> createState() => _SavedExperiencesScreenState();
}

class _SavedExperiencesScreenState extends State<SavedExperiencesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SavedExperienceCubit(),
      child: BlocBuilder<SavedExperienceCubit, SavedExperienceStates>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Column(
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
                      24.verticalSizedBox,
                    ],
                  ),
                  if (state is SavedEperienceLoadedState)
                    (state.experienceData.isEmpty)
                        ? NoDataWidget(title: "No Saved Experiences", subTitle: "Save experiences to see them here.")
                        : Expanded(
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 16 / 9,
                              ),
                              itemCount: state.experienceData.length,
                              itemBuilder: (context, index) {
                                final data = state.experienceData[index];
                                return ExperienceCard(
                                  data: data,
                                  onTap: () =>
                                      CommonUtil().navigateToExperienceDetail(context: context, id: data.id ?? ""),
                                );
                              },
                            ),
                          ),
                  if (state is SavedEperienceLoadingState) ShimmerContainer(height: 200, width: double.maxFinite),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

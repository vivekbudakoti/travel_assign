import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/common.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/experience_gridview.dart';
import 'package:travel_assign/core/widgets/no_data_widget.dart';
import 'package:travel_assign/modules/experience/bloc/experience_cubit.dart';
import 'package:travel_assign/modules/experience/bloc/experience_state.dart';
import 'package:travel_assign/core/widgets/experience_list_shimmer.dart';
import 'package:travel_assign/modules/experience/view/widgets/experience_screen_interest_list.dart';
import 'package:travel_assign/modules/experience/view/widgets/experience_top_bar.dart';
import 'package:travel_assign/modules/experience/view/widgets/interest_row_shimmer.dart';
import 'package:travel_assign/modules/onboarding/bloc/onboarding_cubit.dart';
import 'package:travel_assign/modules/onboarding/bloc/interest_state.dart';
import 'package:travel_assign/modules/onboarding/model/interests_model.dart';
import 'package:travel_assign/modules/saved_experiences/view/saved_experiences_screen.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});
  static final routeName = AppRoutes.experienceScreen;
  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final expereinceBloc = ExperienceCubit();
  List<String> _selectedInterests = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: expereinceBloc,
      child: BlocBuilder<ExperienceCubit, ExperienceState>(
        builder: (context, state) {
          return Scaffold(
            body: RefreshIndicator(
              color: AppColors.graniteGray,
              onRefresh: () async {
                if (state is! ExperienceLoadingState) {
                  expereinceBloc.getExperiences(interests: _selectedInterests);
                }
              },
              child: Column(
                children: [
                  Column(
                    children: [
                      context.viewPadding.top.verticalSizedBox,
                      ExperienceTopBar(
                        onTapHeartIcon: () {
                          context.push(
                            SavedExperiencesScreen.routeName,
                            extra: {
                              RouteConstants.onBackSuccess: () {
                                expereinceBloc.getExperiences(interests: _selectedInterests, isRefresh: true);
                              },
                            },
                          );
                        },
                      ),
                      40.verticalSizedBox,
                      BlocProvider(
                        create: (_) => OnboardingCubit()..getUserInterests(),
                        child: SizedBox(
                          height: 80,
                          child: BlocConsumer<OnboardingCubit, OnboardingState>(
                            listener: (context, state) {
                              if (state is OnboardingSuccessState) {
                                expereinceBloc.getExperiences(interests: state.selectedInterests);
                                _selectedInterests = state.selectedInterests;
                              }
                            },
                            builder: (context, state) {
                              switch (state) {
                                case OnboardingSuccessState():
                                  return ExperienceScreenInterestList(
                                    dataModel: state.data,
                                    onTapListItem: (data) {
                                      _onTapInterestOption(data: data, context: context, state: state);
                                    },
                                  );
                                case OnboardingErrorState():
                                  return SizedBox();

                                default:
                                  return InterestRowShimmer();
                              }
                            },
                          ),
                        ),
                      ),
                      20.verticalSizedBox,
                    ],
                  ),

                  if (state is ExperienceSuccessState)
                    Expanded(
                      child: state.experienceData.isEmpty
                          ? PlaceHolderStateWidget(title: context.l10n.no_data_found)
                          : ExperienceGridview(
                              experienceData: state.experienceData,
                              onTapCard: (data) {
                                CommonUtil().navigateToExperienceDetail(
                                  context: context,
                                  id: data.id,
                                  extra: {
                                    RouteConstants.onBackSuccess: () {
                                      expereinceBloc.getExperiences(interests: _selectedInterests, isRefresh: true);
                                    },
                                  },
                                );
                              },
                            ),
                    )
                  else if (state is ExperienceErrorState)
                    PlaceHolderStateWidget(
                      title: context.l10n.something_went_wrong,
                      isError: true,
                      onTap: () {
                        expereinceBloc.getExperiences(interests: _selectedInterests);
                      },
                    )
                  else
                    const ExperienceListShimmer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onTapInterestOption({
    required InterestsModel data,
    required BuildContext context,
    required OnboardingSuccessState state,
  }) {
    data.isSelected = !data.isSelected;
    context.read<OnboardingCubit>().updateInterests(data);
    _selectedInterests = state.selectedInterests;
    expereinceBloc.getExperiences(interests: state.selectedInterests);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/common.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/no_data_widget.dart';
import 'package:travel_assign/features/experience/bloc/experience_cubit.dart';
import 'package:travel_assign/features/experience/bloc/experience_state.dart';
import 'package:travel_assign/features/experience/view/widgets/experience_gridview.dart';
import 'package:travel_assign/features/experience/view/widgets/experience_list_shimmer.dart';
import 'package:travel_assign/features/experience/view/widgets/experience_screen_interest_list.dart';
import 'package:travel_assign/features/experience/view/widgets/experience_top_bar.dart';
import 'package:travel_assign/features/experience/view/widgets/interest_row_shimmer.dart';
import 'package:travel_assign/features/onboarding/bloc/interest_cubit.dart';
import 'package:travel_assign/features/onboarding/bloc/interest_state.dart';
import 'package:travel_assign/features/onboarding/model/interests_model.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});
  static final routeName = AppRoutes.experienceScreen;

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final expereinceBloc = ExperienceCubit();
  List<String>? _selectedInterests;
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
                if (state is ExperienceSuccessState) {
                  expereinceBloc.getExperiences(interests: _selectedInterests ?? []);
                }
              },
              child: Column(
                children: [
                  // ---------------- HEADER ----------------
                  Column(
                    children: [
                      context.viewPadding.top.verticalSizedBox,
                      ExperienceTopBar(),
                      40.verticalSizedBox,
                      // ---------------- INTERESTS ----------------
                      BlocProvider(
                        create: (_) => InterestCubit()..getUserInterests(),
                        child: SizedBox(
                          height: 80,
                          child: BlocConsumer<InterestCubit, InterestState>(
                            listener: (context, state) {
                              if (state is InterestSuccessState) {
                                expereinceBloc.getExperiences(interests: state.selectedInterests);
                                _selectedInterests = state.selectedInterests;
                              }
                            },
                            builder: (context, state) {
                              switch (state) {
                                case InterestSuccessState():
                                  return ExperienceScreenInterestList(
                                    dataModel: state.data,
                                    onTapListItem: (data) {
                                      _onTapInterestOption(data: data, context: context, state: state);
                                    },
                                  );
                                case InterstErrorState():
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

                  // ---------------- EXPERIENCE LIST ----------------
                  if (state is ExperienceSuccessState)
                    Expanded(
                      child: state.experienceData.isEmpty
                          ? PlaceHolderStateWidget(title: context.l10n.no_data_found)
                          : ExperienceGridview(
                              experienceData: state.experienceData,
                              onTapCard: (data) {
                                CommonUtil().navigateToExperienceDetail(context: context, id: data.id ?? "");
                              },
                            ),
                    ),

                  if (state is ExperienceLoadingState || state is ExperienceInitalState) ExperienceListShimmer(),

                  if (state is ExperienceErrorState)
                    PlaceHolderStateWidget(
                      title: context.l10n.something_went_wrong,
                      onTap: () {
                        expereinceBloc.getExperiences(interests: _selectedInterests ?? []);
                      },
                    ),
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
    required InterestSuccessState state,
  }) {
    data.isSelected = !data.isSelected;
    context.read<InterestCubit>().updateInterests(data);
    _selectedInterests = state.selectedInterests;
    expereinceBloc.getExperiences(interests: state.selectedInterests);
  }
}

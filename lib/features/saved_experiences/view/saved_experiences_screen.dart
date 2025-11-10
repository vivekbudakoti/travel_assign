import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/common.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/experience_gridview.dart';
import 'package:travel_assign/core/widgets/no_data_widget.dart';
import 'package:travel_assign/core/widgets/shimmer_container.dart';
import 'package:travel_assign/features/saved_experiences/bloc/saved_eperience_states.dart';
import 'package:travel_assign/features/saved_experiences/bloc/saved_experience_cubit.dart';

class SavedExperiencesScreen extends StatefulWidget {
  const SavedExperiencesScreen({super.key, required this.extra});
  final Object? extra;

  static final String routeName = AppRoutes.savedExperiencesScreen;
  @override
  State<SavedExperiencesScreen> createState() => _SavedExperiencesScreenState();
}

class _SavedExperiencesScreenState extends State<SavedExperiencesScreen> {
  Function? _onBack;
  bool _isSavedPrefChanged = false;
  @override
  void initState() {
    super.initState();
    if (widget.extra is Map && (widget.extra as Map)[RouteConstants.onBackSuccess] is Function) {
      _onBack = (widget.extra as Map)[RouteConstants.onBackSuccess];
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop && _isSavedPrefChanged) {
          _onBack?.call();
        }
      },
      child: BlocProvider(
        create: (_) => SavedExperienceCubit(),
        child: BlocBuilder<SavedExperienceCubit, SavedExperienceStates>(
          builder: (context, state) {
            return Scaffold(
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: RefreshIndicator(
                  color: AppColors.graniteGray,
                  onRefresh: () async {
                    context.read<SavedExperienceCubit>().getSavedExperiences();
                  },
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
                              Text(context.l10n.saved_experiences, style: context.textTheme.headlineSmall),
                            ],
                          ),
                          24.verticalSizedBox,
                        ],
                      ),
                      if (state is SavedEperienceLoadedState)
                        (state.experienceData.isEmpty)
                            ? PlaceHolderStateWidget(
                                title: context.l10n.no_saved_exp,
                                subTitle: context.l10n.save_exp_to_see,
                              )
                            : Expanded(
                                child: ExperienceGridview(
                                  experienceData: state.experienceData,
                                  padding: EdgeInsets.zero,
                                  onHeratTapCallBack: () {
                                    _toggleSavedPrefChanged();
                                  },
                                  onTapCard: (data) {
                                    CommonUtil().navigateToExperienceDetail(
                                      context: context,
                                      id: data.id ?? "",
                                      extra: {
                                        RouteConstants.onBackSuccess: () {
                                          context.read<SavedExperienceCubit>().refreshExperiences();
                                          _toggleSavedPrefChanged();
                                        },
                                      },
                                    );
                                  },
                                ),
                              ),
                      if (state is SavedEperienceLoadingState) ShimmerContainer(height: 200, width: double.maxFinite),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _toggleSavedPrefChanged() {
    if (!_isSavedPrefChanged) _isSavedPrefChanged = true;
  }
}

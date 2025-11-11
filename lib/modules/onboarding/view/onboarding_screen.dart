import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/no_data_widget.dart';
import 'package:travel_assign/modules/onboarding/bloc/onboarding_cubit.dart';
import 'package:travel_assign/modules/onboarding/bloc/onboarding_state.dart';
import 'package:travel_assign/modules/onboarding/view/widgets/interest_gridview.dart';
import 'package:travel_assign/modules/onboarding/view/widgets/interest_loading.dart';
import 'package:travel_assign/modules/onboarding/view/widgets/onboarding_bottom.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static final routeName = AppRoutes.interestScreen;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit()..getInterests(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Scaffold(
            bottomSheet: state is OnboardingSuccessState
                ? Padding(
                    padding: EdgeInsets.only(bottom: context.viewPadding.bottom),
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return OnboardingBottom(
                          onContinue: () async {
                            await _onTapContinue(setState, context);
                          },
                          lable: _isSaving ? context.l10n.saving : context.l10n.continue_text,
                          isDisabled: _isSaving || state.selectedInterests.length < 2,
                        );
                      },
                    ),
                  )
                : null,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.viewPadding.top.verticalSizedBox,
                  20.verticalSizedBox,
                  Text(context.l10n.select_intrests, style: context.textTheme.headlineLarge),
                  4.verticalSizedBox,
                  Text(
                    context.l10n.help_us_intrests,
                    style: context.textTheme.bodyMedium?.copyWith(color: AppColors.graniteGray),
                  ),
                  16.verticalSizedBox,
                  if (state is OnboardingSuccessState)
                    state.data.isEmpty
                        ? PlaceHolderStateWidget(
                            title: context.l10n.no_data_found,
                            subTitle: context.l10n.working_on_it,
                          )
                        : InterestGridview(
                            interestsData: state.data,
                            onTapinterest: (data) {
                              data.isSelected = !data.isSelected;
                              context.read<OnboardingCubit>().updateInterests(data);
                            },
                          )
                  else if (state is OnboardingErrorState)
                    PlaceHolderStateWidget(title: context.l10n.something_went_wrong, isError: true)
                  else
                    const InterestLoading(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _onTapContinue(StateSetter setState, BuildContext context) async {
    _isSaving = true;
    setState(() {});
    await context.read<OnboardingCubit>().onTapContinue();
    _isSaving = false;
    setState(() {});
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/features/onboarding/bloc/interest_cubit.dart';
import 'package:travel_assign/features/onboarding/bloc/interest_state.dart';
import 'package:travel_assign/features/onboarding/view/widgets/interest_loading.dart';
import 'package:travel_assign/features/onboarding/view/widgets/intrerest_bottom.dart';
import 'package:travel_assign/features/onboarding/view/widgets/intrerest_card.dart';

class InterestScreen extends StatelessWidget {
  InterestScreen({super.key});

  static final routeName = AppRoutes.interestScreen;
  bool _isSaving = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InterestCubit()..getInterests(),
      child: BlocBuilder<InterestCubit, InterestState>(
        builder: (context, state) {
          switch (state) {
            case InterestSuccessState():
              final interestsData = state.data;
              return Scaffold(
                bottomSheet: Padding(
                  padding: EdgeInsets.only(bottom: context.viewPadding.bottom),
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      return IntrerestBottom(
                        onContinue: () async {
                          _isSaving = true;
                          setState(() {});
                          await context.read<InterestCubit>().onTapContinue();
                          _isSaving = false;
                          setState(() {});
                        },
                        lable: _isSaving ? context.l10n.saving : context.l10n.continue_text,
                        isDisabled: _isSaving || state.selectedInterests.length < 2,
                      );
                    },
                  ),
                ),
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
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.only(bottom: 100),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemCount: interestsData.length,
                          itemBuilder: (context, index) {
                            final data = interestsData[index];
                            return IntrerestCard(
                              title: data.title ?? "",
                              imageUrl: data.imageUrl ?? "",
                              isSelected: data.isSelected,
                              onTap: () {
                                data.isSelected = !data.isSelected;
                                context.read<InterestCubit>().updateInterests(data);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );

            default:
              return InterestLoading();
          }
        },
      ),
    );
  }
}

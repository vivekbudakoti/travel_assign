import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/features/experience/view/experience_screen.dart';
import 'package:travel_assign/features/onboarding/bloc/interest_cubit.dart';
import 'package:travel_assign/features/onboarding/bloc/interest_state.dart';
import 'package:travel_assign/features/onboarding/view/widgets/intrerest_bottom.dart';
import 'package:travel_assign/features/onboarding/view/widgets/intrerest_card.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  static final routeName = AppRoutes.interestScreen;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InterestCubit(),
      child: BlocBuilder<InterestCubit, InterestState>(
        builder: (context, state) {
          switch (state) {
            case InterestSuccessState():
              return Scaffold(
                bottomSheet: Padding(
                  padding: EdgeInsets.only(bottom: context.viewPadding.bottom),
                  child: IntrerestBottom(onContinue: () => context.pushReplacement(ExperienceScreen.routeName)),
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
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return IntrerestCard(
                              title: "Mountains",
                              imageUrl:
                                  "https://cdn.pixabay.com/photo/2024/02/29/15/19/ai-generated-8604636_960_720.jpg",
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            // TODO: Handle this case.
            //
            default:
              return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

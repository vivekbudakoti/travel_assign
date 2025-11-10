import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/core/routes/router.dart';
import 'package:travel_assign/modules/experience/view/experience_screen.dart';
import 'package:travel_assign/modules/onboarding/bloc/interest_state.dart';
import 'package:travel_assign/modules/onboarding/model/interests_model.dart';
import 'package:travel_assign/modules/onboarding/repository/interest_repo.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitalState());

  Future<void> getInterests() async {
    emit(OnboardingLoadingState());
    try {
      final data = await InterestRepo.instance.getInterests();
      emit(OnboardingSuccessState(data: data));
    } catch (e) {
      emit(OnboardingErrorState());
    }
  }

  Future<void> getUserInterests() async {
    emit(OnboardingLoadingState());
    try {
      final userData = await InterestRepo.instance.getUserInterests();
      emit(OnboardingSuccessState(data: userData));
    } catch (e) {
      emit(OnboardingErrorState());
    }
  }

  void updateInterests(InterestsModel data) {
    if (data.id != null && state is OnboardingSuccessState) {
      final successState = state as OnboardingSuccessState;
      if (data.isSelected) {
        successState.selectedInterests.add(data.id!);
      } else {
        successState.selectedInterests.remove(data.id!);
      }
      emit(successState.copyWith(selectedInterests: successState.selectedInterests));
    }
  }

  Future<bool> onTapContinue() async {
    if (state is OnboardingSuccessState) {
      final successState = state as OnboardingSuccessState;
      final status = await InterestRepo.instance.saveInterests(ids: successState.selectedInterests);
      if (status) {
        AppRouter.router.push(ExperienceScreen.routeName);
      }
      return status;
    }
    return false;
  }
}

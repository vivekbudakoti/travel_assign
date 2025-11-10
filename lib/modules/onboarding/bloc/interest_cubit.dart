import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/core/routes/router.dart';
import 'package:travel_assign/modules/experience/view/experience_screen.dart';
import 'package:travel_assign/modules/onboarding/bloc/interest_state.dart';
import 'package:travel_assign/modules/onboarding/model/interests_model.dart';
import 'package:travel_assign/modules/onboarding/repository/interest_repo.dart';

class InterestCubit extends Cubit<InterestState> {
  InterestCubit() : super(InterstInitalState());

  Future<void> getInterests() async {
    emit(InterstLoadingState());
    try {
      final data = await InterestRepo().getInterests();
      emit(InterestSuccessState(data: data));
    } catch (e) {
      emit(InterstErrorState());
    }
  }

  Future<void> getUserInterests() async {
    emit(InterstLoadingState());
    try {
      final userData = await InterestRepo().getUserInterests();
      emit(InterestSuccessState(data: userData));
    } catch (e) {
      emit(InterstErrorState());
    }
  }

  void updateInterests(InterestsModel data) {
    if (data.id != null && state is InterestSuccessState) {
      final successState = state as InterestSuccessState;
      if (data.isSelected) {
        successState.selectedInterests.add(data.id!);
      } else {
        successState.selectedInterests.remove(data.id!);
      }
      emit(successState.copyWith(selectedInterests: successState.selectedInterests));
    }
  }

  Future<bool> onTapContinue() async {
    if (state is InterestSuccessState) {
      final successState = state as InterestSuccessState;
      final status = await InterestRepo().saveInterests(ids: successState.selectedInterests);
      if (status) {
        AppRouter.router.push(ExperienceScreen.routeName);
      }
      return status;
    }
    return false;
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/core/utils/common.dart';
import 'package:travel_assign/modules/experience_details/bloc/experience_details_state.dart';
import 'package:travel_assign/modules/experience_details/repo/experience_repo.dart';

class ExperienceDetailsCubit extends Cubit<ExperienceDetailsState> {
  ExperienceDetailsCubit() : super(ExperienceDetailsInitialState());

  Future<void> getDetails({required String id}) async {
    emit(ExperienceDetailsLoadingState());
    try {
      final data = await ExperienceDetailsRepo.instance.getDetails(id: id);
      if (data != null) {
        emit(ExperienceDetailsSuccessState(experienceData: data));
      } else {
        emit(ExperienceDetailsErrorState(message: "No data found"));
      }
    } catch (e) {
      emit(ExperienceDetailsErrorState(message: "Something went wrong"));
    }
  }

  Future<bool> toggleSaveExperience({required String id}) async {
    if (state is ExperienceDetailsSuccessState) {
      final successState = state as ExperienceDetailsSuccessState;
      final experience = successState.experienceData;

      if (experience.id == id) {
        final status = await CommonUtil.instance.toggleExperienceSave(
          id: id,
          experienceList: [experience], // Single item list for details screen
        );

        if (status) {
          emit(ExperienceDetailsSuccessState(experienceData: experience));
          return true;
        }
      }
    }
    return false;
  }
}

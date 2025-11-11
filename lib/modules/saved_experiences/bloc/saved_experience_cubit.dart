import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/modules/saved_experiences/bloc/saved_eperience_states.dart';
import 'package:travel_assign/modules/saved_experiences/repo/saved_experience_repo.dart';

class SavedExperienceCubit extends Cubit<SavedExperienceStates> {
  SavedExperienceCubit() : super(SavedEperienceInitialstate()) {
    getSavedExperiences();
  }

  Future<void> getSavedExperiences({bool isRefresh = false}) async {
    if (!isRefresh) {
      emit(SavedEperienceLoadingState());
    }
    try {
      final data = await SavedExperienceRepo.instance.getSavedExperiences();
      emit(SavedEperienceLoadedState(experienceData: data));
    } catch (e) {
      emit(SavedEperienceErrorState());
    }
  }
}

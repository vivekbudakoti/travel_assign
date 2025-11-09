import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/features/saved_experiences/bloc/saved_eperience_states.dart';
import 'package:travel_assign/features/saved_experiences/repo/repo.dart';

class SavedExperienceCubit extends Cubit<SavedExperienceStates> {
  SavedExperienceCubit() : super(SavedEperienceInitialstate()) {
    getSavedExperiences();
  }

  Future<void> getSavedExperiences() async {
    emit(SavedEperienceLoadingState());
    try {
      final data = await SavedExperienceRepo().getSavedExperiences();
      emit(SavedEperienceLoadedState(experienceData: data));
    } catch (e) {
      emit(SavedEperienceErrorState());
    }
  }
}

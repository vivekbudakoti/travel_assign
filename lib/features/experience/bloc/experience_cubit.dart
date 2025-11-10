import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/features/experience/bloc/experience_state.dart';
import 'package:travel_assign/features/experience/model/experience_data_model.dart';
import 'package:travel_assign/features/experience/repository/experience_repo.dart';
import 'package:travel_assign/features/saved_experiences/repo/saved_experience_repo.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  ExperienceCubit() : super(ExperienceInitalState());

  Future<void> getExperiences({List<String> interests = const []}) async {
    emit(ExperienceLoadingState());
    try {
      final data = await ExperienceRepo().getExperiences(interests: interests);
      emit(ExperienceSuccessState(experienceData: data));
    } catch (e) {
      emit(ExperienceErrorState());
    }
  }

  Future<void> refreshExperiences({List<String> interests = const []}) async {
    try {
      final data = await ExperienceRepo().getExperiences(interests: interests);
       final  List<ExperienceDataModel>  newData = List.from(data);
      emit(ExperienceSuccessState(experienceData: newData));
    } catch (e) {
      emit(ExperienceErrorState());
    }
  }

  Future<bool> saveExperience({required String id}) {
    return SavedExperienceRepo().saveExperiences(id: id);
  }
}

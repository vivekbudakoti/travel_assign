import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/features/experience/bloc/experience_state.dart';
import 'package:travel_assign/features/experience/repository/repo.dart';

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
}

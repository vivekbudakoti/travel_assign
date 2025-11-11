import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/modules/experience/bloc/experience_state.dart';
import 'package:travel_assign/modules/experience/repository/experience_repo.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  ExperienceCubit() : super(ExperienceInitalState());

  Future<void> getExperiences({List<String> interests = const [], bool isRefresh = false}) async {
    if (!isRefresh) emit(ExperienceLoadingState());
    try {
      final data = await ExperienceRepo.instance.getExperiences(interests: interests);
      emit(ExperienceSuccessState(experienceData: data));
    } catch (e) {
      emit(ExperienceErrorState());
    }
  }
}

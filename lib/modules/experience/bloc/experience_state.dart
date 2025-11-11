import 'package:travel_assign/core/model/experience_data_model.dart';

abstract class ExperienceState {}

class ExperienceInitalState extends ExperienceState {}

class ExperienceLoadingState extends ExperienceState {}

class ExperienceSuccessState extends ExperienceState {
  final List<ExperienceDataModel> experienceData;

  ExperienceSuccessState({required this.experienceData});
}

class ExperienceErrorState extends ExperienceState {}

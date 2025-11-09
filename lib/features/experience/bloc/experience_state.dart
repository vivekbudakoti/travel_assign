import 'package:travel_assign/features/experience/model/experience_data_model.dart';

abstract class ExperienceState {}

class ExperienceInitalState extends ExperienceState {}

class ExperienceLoadingState extends ExperienceState {}

class IntrestLoaded extends ExperienceState {
  final List<String> intrests;
  IntrestLoaded({required this.intrests});
}

class ExperienceSuccessState extends ExperienceState {
  final List<ExperienceDataModel> experienceData;
  
  ExperienceSuccessState({required this.experienceData});
}

class ExperienceErrorState extends ExperienceState {}

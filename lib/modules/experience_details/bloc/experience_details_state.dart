import 'package:travel_assign/core/model/experience_data_model.dart';

abstract class ExperienceDetailsState {}

class ExperienceDetailsInitialState extends ExperienceDetailsState {}

class ExperienceDetailsLoadingState extends ExperienceDetailsState {}

class ExperienceDetailsSuccessState extends ExperienceDetailsState {
  final ExperienceDataModel experienceData;

  ExperienceDetailsSuccessState({required this.experienceData});
}

class ExperienceDetailsErrorState extends ExperienceDetailsState {
  final String message;
  ExperienceDetailsErrorState({required this.message});
}

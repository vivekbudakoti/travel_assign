import 'package:travel_assign/modules/experience/model/experience_data_model.dart';

abstract class SavedExperienceStates {}

class SavedEperienceInitialstate extends SavedExperienceStates {}

class SavedEperienceLoadingState extends SavedExperienceStates {}

class SavedEperienceLoadedState extends SavedExperienceStates {
  final List<ExperienceDataModel> experienceData;

  SavedEperienceLoadedState({required this.experienceData});
}

class SavedEperienceErrorState extends SavedExperienceStates {}

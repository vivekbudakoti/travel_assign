import 'package:travel_assign/features/experience/model/experience_data_model.dart';
import 'package:travel_assign/features/saved_experiences/data.dart';

class SavedExperienceRepo {
  final SavedExperiencesData dataSource = SavedExperiencesLocalData();

  Future<bool> saveExperiences({required String id}) {
    return dataSource.saveExperiences(id: id);
  }

  Future<bool> removeSavedExperiences({required String id}) {
    return dataSource.removeExperiences(id: id);
  }

  Future<List<ExperienceDataModel>> getSavedExperiences() {
    return dataSource.getSavedExperiences();
  }
}

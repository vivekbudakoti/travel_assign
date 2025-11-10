import 'package:travel_assign/modules/experience/model/experience_data_model.dart';
import 'package:travel_assign/modules/saved_experiences/data/data.dart';

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

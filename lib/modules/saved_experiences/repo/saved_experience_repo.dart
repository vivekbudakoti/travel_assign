import 'package:travel_assign/modules/experience/model/experience_data_model.dart';
import 'package:travel_assign/modules/saved_experiences/data/saved_experiences_data.dart';

class SavedExperienceRepo {
  static SavedExperienceRepo? _instance;
  late final SavedExperiencesData dataSource;

  SavedExperienceRepo._internal() {
    dataSource = SavedExperiencesLocalData();
  }

  static SavedExperienceRepo get instance => _instance ??= SavedExperienceRepo._internal();

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

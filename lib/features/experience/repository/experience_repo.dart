import 'package:travel_assign/features/experience/data/experience_data.dart';
import 'package:travel_assign/features/experience/model/experience_data_model.dart';

class ExperienceRepo {
  final ExperienceData dataSource = ExperienceLocalData();

  Future<List<ExperienceDataModel>> getExperiences({List<String> interests = const []}) async {
    return await dataSource.getExperiences(interests: interests);
  }
}

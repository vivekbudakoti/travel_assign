import 'package:travel_assign/modules/experience/repo/data/experience_data.dart';
import 'package:travel_assign/core/model/experience_data_model.dart';

class ExperienceRepo {
  static ExperienceRepo? _instance;
  late final ExperienceData dataSource;

  ExperienceRepo._internal() {
    dataSource = ExperienceLocalData();
  }

  static ExperienceRepo get instance => _instance ??= ExperienceRepo._internal();

  Future<List<ExperienceDataModel>> getExperiences({List<String> interests = const []}) async {
    return await dataSource.getExperiences(interests: interests);
  }
}

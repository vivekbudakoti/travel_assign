import 'package:travel_assign/core/constants/raw_json.dart';
import 'package:travel_assign/features/experience/model/experience_data_model.dart';

abstract class ExperienceData {
  Future<List<ExperienceDataModel>> getExperiences({List<String> interests = const []});
}

class ExperienceLocalData extends ExperienceData {
  @override
  Future<List<ExperienceDataModel>> getExperiences({List<String> interests = const []}) async {
    await Future.delayed(Duration(seconds: 2));
    Map<String, Map<String, dynamic>> filteredData = {};
    if (interests.isEmpty) {
      filteredData = experienceRawData;
    } else {
      experienceRawData.forEach((key, value) {
        if (value['interests'] is List) {
          for (int i = 0; i < interests.length; i++) {
            if (value['interests'].contains(interests[i])) {
              filteredData[key] = value;
              break;
            }
          }
        }
      });
    }
    return Future.value(ExperienceDataModel.getListFromRawData(filteredData));
  }
}

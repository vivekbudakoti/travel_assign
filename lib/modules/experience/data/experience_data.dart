import 'package:travel_assign/core/constants/raw_json.dart';
import 'package:travel_assign/core/utils/common.dart';
import 'package:travel_assign/modules/experience/model/experience_data_model.dart';

abstract class ExperienceData {
  Future<List<ExperienceDataModel>> getExperiences({List<String> interests = const []});
}

class ExperienceLocalData extends ExperienceData {
  @override
  Future<List<ExperienceDataModel>> getExperiences({List<String> interests = const []}) async {
    await Future.delayed(Duration(milliseconds: 250));
    Map<String, Map<String, dynamic>> filteredData = {};
    final savedJson = CommonUtil.instance.getSavedExpFromSharedPref();
    experienceRawData.forEach((key, value) {
      Map<String, dynamic> currentData = Map.from(value);
      bool isAdded = false;
      if (interests.isEmpty) {
        isAdded = true;
      } else {
        if (value['interests'] is Map) {
          for (int i = 0; i < interests.length; i++) {
            if (value['interests'].keys.contains(interests[i])) {
              isAdded = true;
              break;
            }
          }
        }
      }
      if (isAdded) {
        currentData['is_saved'] = savedJson[key] != null;
        filteredData[key] = currentData;
      }
    });
    return ExperienceDataModel.getListFromRawData(filteredData);
  }
}

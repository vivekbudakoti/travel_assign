import 'dart:convert';

import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/constants/raw_json.dart';
import 'package:travel_assign/core/utils/shared_pref_util.dart';
import 'package:travel_assign/features/experience/model/experience_data_model.dart';

abstract class ExperienceData {
  Future<List<ExperienceDataModel>> getExperiences({List<String> interests = const []});
}

class ExperienceLocalData extends ExperienceData {
  @override
  Future<List<ExperienceDataModel>> getExperiences({List<String> interests = const []}) async {
    await Future.delayed(Duration(milliseconds: 250));
    Map<String, Map<String, dynamic>> filteredData = {};
    final savedJson = _getFromSharedPrefernce();
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
    return Future.value(ExperienceDataModel.getListFromRawData(filteredData));
  }

  Map<String, Map<String, dynamic>> _getFromSharedPrefernce() {
    final pref = SharedPrefUtil();
    final savedData = pref.getString(SharedPreferencesConstants.savedExperiences);

    if (savedData == null || savedData.isEmpty) return {};

    final decoded = jsonDecode(savedData);

    if (decoded is! Map) return {};

    return decoded.map((key, value) => MapEntry(key.toString(), Map<String, dynamic>.from(value as Map)));
  }
}

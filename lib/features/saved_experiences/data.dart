import 'dart:convert';

import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/constants/raw_json.dart';
import 'package:travel_assign/core/utils/shared_pref_util.dart';

abstract class SavedExperiencesData {
  Future<bool> saveExperiences({required String id});
  Future<bool> removeExperiences({required String id});
}

class SavedExperiencesLocalData extends SavedExperiencesData {
  @override
  Future<bool> saveExperiences({required String id}) async {
    if (experienceRawData[id] != null) {
      final pref = SharedPrefUtil();
      final savedData = pref.getString(SharedPreferencesConstants.savedExperiences);
      final savedJson = jsonDecode(savedData ?? '{}');
      savedJson[id] = experienceRawData[id];
      return await pref.setString(SharedPreferencesConstants.savedExperiences, jsonEncode(savedJson));
    }
    return false;
  }

  @override
  Future<bool> removeExperiences({required String id}) async {
    final pref = SharedPrefUtil();
    final savedData = pref.getString(SharedPreferencesConstants.savedExperiences);
    final savedJson = jsonDecode(savedData ?? '{}');
    savedJson.remove(id);
    return await pref.setString(SharedPreferencesConstants.savedExperiences, jsonEncode(savedJson));
  }
}

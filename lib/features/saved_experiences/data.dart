import 'dart:convert';

import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/constants/raw_json.dart';
import 'package:travel_assign/core/utils/shared_pref_util.dart';
import 'package:travel_assign/features/experience/model/experience_data_model.dart';

abstract class SavedExperiencesData {
  Future<bool> saveExperiences({required String id});
  Future<bool> removeExperiences({required String id});
  Future<List<ExperienceDataModel>> getSavedExperiences();
}

class SavedExperiencesLocalData extends SavedExperiencesData {
  @override
  Future<bool> saveExperiences({required String id}) async {
    if (experienceRawData[id] != null) {
      final pref = SharedPrefUtil();
      final savedData = pref.getString(SharedPreferencesConstants.savedExperiences);
      final savedJson = jsonDecode(savedData ?? '{}');
      experienceRawData[id]?['is_saved'] = true;
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

  @override
  Future<List<ExperienceDataModel>> getSavedExperiences() async {
    await Future.delayed(const Duration(milliseconds: 250));

    final pref = SharedPrefUtil();
    final savedData = pref.getString(SharedPreferencesConstants.savedExperiences);

    if (savedData == null || savedData.isEmpty) return [];

    final decoded = jsonDecode(savedData);

    if (decoded is! Map) return [];

    final Map<String, Map<String, dynamic>> savedJson = decoded.map(
      (key, value) => MapEntry(key.toString(), Map<String, dynamic>.from(value as Map)),
    );

    return ExperienceDataModel.getListFromRawData(savedJson);
  }
}

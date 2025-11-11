import 'dart:convert';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/constants/raw_json.dart';
import 'package:travel_assign/core/utils/common.dart';
import 'package:travel_assign/core/utils/shared_pref_util.dart';
import 'package:travel_assign/core/model/experience_data_model.dart';

abstract class SavedExperiencesData {
  Future<bool> saveExperiences({required String id});
  Future<bool> removeExperiences({required String id});
  Future<List<ExperienceDataModel>> getSavedExperiences();
}

class SavedExperiencesLocalData extends SavedExperiencesData {
  @override
  Future<bool> saveExperiences({required String id}) async {
    if (experienceRawData[id] != null) {
      final savedJson = CommonUtil.instance.getSavedExpFromSharedPref();
      final Map<String, dynamic> experience = Map.from(experienceRawData[id] ?? {});
      experience['is_saved'] = true;
      savedJson[id] = experience;
      return await _setSavedExperience(savedJson);
    }
    return false;
  }

  @override
  Future<bool> removeExperiences({required String id}) async {
    final savedJson = CommonUtil.instance.getSavedExpFromSharedPref();
    savedJson.remove(id);
    return _setSavedExperience(savedJson);
  }

  @override
  Future<List<ExperienceDataModel>> getSavedExperiences() async {
    final savedJson = CommonUtil.instance.getSavedExpFromSharedPref();
    return ExperienceDataModel.getListFromRawData(savedJson);
  }

  Future<bool> _setSavedExperience(Map<String, Map<String, dynamic>> savedJson) async {
    final pref = SharedPrefUtil();
    return await pref.setString(SharedPreferencesConstants.savedExperiences, jsonEncode(savedJson));
  }
}

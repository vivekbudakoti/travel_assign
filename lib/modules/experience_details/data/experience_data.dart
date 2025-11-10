import 'package:travel_assign/core/constants/raw_json.dart';
import 'package:travel_assign/core/utils/common.dart';
import 'package:travel_assign/modules/experience/model/experience_data_model.dart';

abstract class ExperienceDetailsData {
  Future<ExperienceDataModel?> getDetails(String id);
}

class ExperienceDetailsLocalData extends ExperienceDetailsData {
  @override
  Future<ExperienceDataModel?> getDetails(String id) async {
    final Map<String, dynamic> experience = Map.from(experienceRawData[id] ?? {});
    final savedData = CommonUtil().getSavedExpFromSharedPref();
    experience['is_saved'] = savedData[id] != null;
    return ExperienceDataModel.fromMap(experience);
  }
}

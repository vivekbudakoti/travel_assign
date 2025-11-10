import 'package:travel_assign/features/experience/model/experience_data_model.dart';
import 'package:travel_assign/features/experience_details/data/experience_data.dart';

class ExperienceDetailsRepo {
  final ExperienceDetailsData _experienceDetailsData = ExperienceDetailsLocalData();
  Future<ExperienceDataModel?> getDetails({required String id}) async {
    return _experienceDetailsData.getDetails(id);
  }
}

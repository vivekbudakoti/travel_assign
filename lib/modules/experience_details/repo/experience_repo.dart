import 'package:travel_assign/modules/experience/model/experience_data_model.dart';
import 'package:travel_assign/modules/experience_details/data/experience_data.dart';

class ExperienceDetailsRepo {
  static ExperienceDetailsRepo? _instance;
  late final ExperienceDetailsData dataSource;

  ExperienceDetailsRepo._internal() {
    dataSource = ExperienceDetailsLocalData();
  }

  static ExperienceDetailsRepo get instance => _instance ??= ExperienceDetailsRepo._internal();

  Future<ExperienceDataModel?> getDetails({required String id}) async {
    return await dataSource.getDetails(id);
  }
}

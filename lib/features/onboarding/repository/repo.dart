import 'package:travel_assign/features/onboarding/data/data.dart';
import 'package:travel_assign/features/onboarding/model/interests_model.dart';

class InterestRepo {
  final InterestData dataSource = InterestLocalData();

  Future<List<InterestsModel>> getInterests() async {
    return await dataSource.getInterests();
  }
}

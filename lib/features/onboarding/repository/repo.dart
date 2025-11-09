import 'package:travel_assign/features/onboarding/data/data.dart';
import 'package:travel_assign/features/onboarding/model/interests_model.dart';

class InterestRepo {
  final InterestData dataSource = InterestLocalData();

  Future<List<InterestsModel>> getInterests() async {
    return await dataSource.getInterests();
  }

  Future<bool> saveInterests({required List<String> ids}) async {
    return await dataSource.saveInterests(ids: ids);
  }

  Future<List<InterestsModel>> getUserInterests() async {
    return await dataSource.getUserInterests();
  }
}

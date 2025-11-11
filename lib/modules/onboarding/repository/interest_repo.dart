import 'package:travel_assign/modules/onboarding/repository/data/interest_data.dart';
import 'package:travel_assign/core/model/interests_model.dart';

class InterestRepo {
  static InterestRepo? _instance;
  late final InterestData dataSource;

  InterestRepo._internal() {
    dataSource = InterestLocalData();
  }

  static InterestRepo get instance => _instance ??= InterestRepo._internal();

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

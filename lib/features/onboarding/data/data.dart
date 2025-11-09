import 'package:travel_assign/core/constants/raw_json.dart';
import 'package:travel_assign/features/onboarding/model/interests_model.dart';

abstract class InterestData {
  Future<List<InterestsModel>> getInterests();
}

class InterestLocalData extends InterestData {
  @override
  Future<List<InterestsModel>> getInterests() async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(InterestsModel.listFromJson(intrestsJson));
  }
}

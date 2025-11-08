import 'package:travel_assign/features/onboarding/data/data.dart';

class Repo {
   final Data dataSource = LocalData();
  Future<void> getData() async {
    final experiences = await dataSource.getExpierences();
  }
}

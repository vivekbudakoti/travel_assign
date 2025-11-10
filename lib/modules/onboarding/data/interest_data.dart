import 'dart:convert';

import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/constants/raw_json.dart';
import 'package:travel_assign/core/utils/shared_pref_util.dart';
import 'package:travel_assign/modules/onboarding/model/interests_model.dart';

abstract class InterestData {
  Future<List<InterestsModel>> getInterests();
  Future<List<InterestsModel>> getUserInterests();
  Future<bool> saveInterests({required List<String> ids});
}

class InterestLocalData extends InterestData {
  @override
  Future<List<InterestsModel>> getInterests() async {
    await Future.delayed(Duration(milliseconds: 600));
    return Future.value(InterestsModel.listFromJson(intrestsJson));
  }

  @override
  Future<List<InterestsModel>> getUserInterests() async {
    await Future.delayed(const Duration(milliseconds: 600));

    final localData = SharedPrefUtil().getString(SharedPreferencesConstants.savedInterest);
    final savedJson = jsonDecode(localData ?? '{}');

    final Map<String, Map<String, dynamic>> selected = {};
    final Map<String, Map<String, dynamic>> unselected = {};

    intrestsJson.forEach((key, value) {
      final isSelected = savedJson[key] != null;
      value['is_selected'] = isSelected;
      (isSelected ? selected : unselected).addAll({key: value});
    });
    selected.addAll(unselected);

    return InterestsModel.listFromJson(selected);
  }

  @override
  Future<bool> saveInterests({required List<String> ids}) {
    final pref = SharedPrefUtil();
    Map<String, Map<String, dynamic>> filteredData = {};

    for (String id in ids) {
      if (intrestsJson[id] != null) {
        intrestsJson[id]!['is_selected'] = true;
        filteredData[id] = intrestsJson[id] ?? {};
      }
    }
    return pref.setString(SharedPreferencesConstants.savedInterest, jsonEncode(filteredData));
  }
}

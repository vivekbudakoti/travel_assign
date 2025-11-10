import 'dart:convert';

import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/utils/shared_pref_util.dart';

class CommonUtil{
    Map<String, Map<String, dynamic>> getSavedExpFromSharedPref() {
    final pref = SharedPrefUtil();
    final savedData = pref.getString(SharedPreferencesConstants.savedExperiences);

    if (savedData == null || savedData.isEmpty) return {};

    final decoded = jsonDecode(savedData);

    if (decoded is! Map) return {};

    return decoded.map((key, value) => MapEntry(key.toString(), Map<String, dynamic>.from(value as Map)));
  }
}
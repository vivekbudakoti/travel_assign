import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/utils/shared_pref_util.dart';
import 'package:travel_assign/features/experience_details/view/experience_detail_screen.dart';

class CommonUtil {
  CommonUtil._internal();
  static final CommonUtil _instance = CommonUtil._internal();
  factory CommonUtil() => _instance;

  Map<String, Map<String, dynamic>> getSavedExpFromSharedPref() {
    final pref = SharedPrefUtil();
    final savedData = pref.getString(SharedPreferencesConstants.savedExperiences);

    if (savedData == null || savedData.isEmpty) return {};

    final decoded = jsonDecode(savedData);

    if (decoded is! Map) return {};

    return decoded.map((key, value) => MapEntry(key.toString(), Map<String, dynamic>.from(value as Map)));
  }

  Future<void> navigateToExperienceDetail({required BuildContext context, required String id}) async {
    context.push("${ExperienceDetailScreen.routeName}/$id");
  }

  static const SliverGridDelegateWithFixedCrossAxisCount experienceGridDelegate =
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 16 / 9,
      );
}

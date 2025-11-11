import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/utils/shared_pref_util.dart';
import 'package:travel_assign/modules/experience_details/view/experience_detail_screen.dart';
import 'package:travel_assign/modules/saved_experiences/repo/saved_experience_repo.dart';

class CommonUtil {
  static CommonUtil? _instance;

  CommonUtil._internal();
  static CommonUtil get instance => _instance ??= CommonUtil._internal();

  Map<String, Map<String, dynamic>> getSavedExpFromSharedPref() {
    final savedData = SharedPrefUtil().getString(SharedPreferencesConstants.savedExperiences);
    if (savedData == null || savedData.isEmpty) return {};

    try {
      final decoded = jsonDecode(savedData);
      if (decoded is! Map) return {};

      return decoded.map((key, value) => MapEntry(key.toString(), Map<String, dynamic>.from(value as Map)));
    } catch (_) {
      return {};
    }
  }

  Future<void> navigateToExperienceDetail({required BuildContext context, String? id, Object? extra}) async {
    if (id != null) {
      context.push("${ExperienceDetailScreen.routeName}/$id", extra: extra);
    }
  }

  static const SliverGridDelegateWithFixedCrossAxisCount interestsGridDelegate =
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      );

  static const SliverGridDelegateWithFixedCrossAxisCount experienceGridDelegate =
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 16 / 9,
      );

  Function? getOnBackFromExtra({Object? extra}) {
    if (extra is Map && extra[RouteConstants.onBackSuccess] is Function) {
      return extra[RouteConstants.onBackSuccess];
    }
    return null;
  }

  /// Toggle save/unsave for a specific experience ID
  /// Used by HeartCubit for independent heart functionality
  Future<bool> toggleExperienceSaveById({required String id, required bool currentSaveStatus}) async {
    bool status = false;
    if (!currentSaveStatus) {
      status = await SavedExperienceRepo.instance.saveExperiences(id: id);
    } else {
      status = await SavedExperienceRepo.instance.removeSavedExperiences(id: id);
    }
    return status;
  }
}

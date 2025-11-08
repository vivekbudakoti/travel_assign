import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/utils/shared_pref_util.dart';
import 'package:travel_assign/core/style/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(DarkThemeState());

  final SharedPrefUtil _prefs = SharedPrefUtil();
  final _themeKey = SharedPreferencesConstants.isDarkTheme;

  Future<void> loadTheme() async {
    final saved = _prefs.getBool(_themeKey);

    if (saved == null) {
      final brightness = PlatformDispatcher.instance.platformBrightness;
      final isDark = brightness == Brightness.dark;

      emit(isDark ? DarkThemeState() : LightThemeState());

      await _saveTheme(isDark);
    } else {
      emit(saved ? DarkThemeState() : LightThemeState());
    }
  }

  Future<void> toggleTheme() async {
    if (state is LightThemeState) {
      emit(DarkThemeState());
      await _saveTheme(true);
    } else {
      emit(LightThemeState());
      await _saveTheme(false);
    }
  }

  Future<void> _saveTheme(bool isDark) async {
    await _prefs.setBool(_themeKey, isDark);
  }
}

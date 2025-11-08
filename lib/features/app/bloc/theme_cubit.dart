import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/style/theme.dart';
import 'package:travel_assign/core/utils/shared_pref_util.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightThemeState());

  final SharedPrefUtil _prefs = SharedPrefUtil();
  final _themeKey = SharedPreferencesConstants.isDarkTheme;

  Future<void> loadTheme() async {
    final isDark = _prefs.getBool(_themeKey) ?? false;
    emit(isDark ? DarkThemeState() : LightThemeState());
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
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }
}

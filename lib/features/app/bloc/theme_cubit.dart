import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/utils/shared_pref_util.dart';
import 'package:travel_assign/core/theme/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(DarkThemeState()) {
    _loadTheme();
  }

  final SharedPrefUtil _prefs = SharedPrefUtil();
  final _themeKey = SharedPreferencesConstants.isDarkTheme;
  bool? get _isDark => _prefs.getBool(_themeKey);
  ThemeData get getTheme => (_isDark == true) ? AppTheme.darkTheme : AppTheme.lightTheme;

  Future<void> _loadTheme() async {
    if (_isDark == null) {
      final brightness = PlatformDispatcher.instance.platformBrightness;
      final isDark = brightness == Brightness.dark;
      await _saveTheme(isDark);
    }
    _emitState();
  }

  Future<void> toggleTheme() async {
    await _saveTheme(state is LightThemeState);
    _emitState();
  }

  void _emitState() {
    if (_isDark == true) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }



  Future<void> _saveTheme(bool isDark) async {
    await _prefs.setBool(_themeKey, isDark);
  }
}

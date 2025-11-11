import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/style/app_textstyle.dart';
import 'package:travel_assign/core/theme/colors.dart';

class AppTheme {
  static ThemeData get lightTheme => _buildTheme(
    brightness: Brightness.light,
    backgroundColor: AppColors.primaryLight,
    textColor: AppColors.primaryTextLight,
  );

  static ThemeData get darkTheme => _buildTheme(
    brightness: Brightness.dark,
    backgroundColor: AppColors.primaryDark,
    textColor: AppColors.primaryTextDark,
  );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color backgroundColor,
    required Color textColor,
  }) {
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: backgroundColor,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: isDark ? AppColors.primaryDark : AppColors.primaryLight),
      colorScheme: ColorScheme.fromSeed(
        seedColor: isDark ? AppColors.primaryDark : AppColors.primaryLight,
        brightness: brightness,
        surface: isDark ? AppColors.primaryLight : AppColors.white,
        primary: isDark ? AppColors.primaryDark : AppColors.primaryLight,
        primaryContainer: isDark ? AppColors.secondary : AppColors.primaryDark,
        inversePrimary: isDark ? AppColors.primaryLight : AppColors.primaryDark,
        onTertiary: isDark ? AppColors.white : AppColors.primaryDark,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.headlineLarge.copyWith(color: textColor),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(color: textColor),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: textColor),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: textColor),
        bodySmall: AppTextStyles.bodySmall.copyWith(color: textColor),
        titleLarge: AppTextStyles.titleLarge.copyWith(color: textColor),
        labelLarge: AppTextStyles.label.copyWith(color: textColor),
        labelSmall: AppTextStyles.labelSmall.copyWith(color: textColor),
      ),
    );
  }
}

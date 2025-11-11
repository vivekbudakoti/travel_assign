part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  final ThemeData themeData;
  const ThemeState(this.themeData);
}

class LightThemeState extends ThemeState {
  LightThemeState() : super(AppTheme.lightTheme);
}

class DarkThemeState extends ThemeState {
  DarkThemeState() : super(AppTheme.darkTheme);
}

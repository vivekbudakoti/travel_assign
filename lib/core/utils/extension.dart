import 'package:flutter/material.dart';
import 'package:travel_assign/l10n/app_localizations.dart';

extension ContextLocalization on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension ContextTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension ContextThemeText on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension ContextThemeColor on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension SizedBoxExtension on num {
  SizedBox get verticalSizedBox => SizedBox(height: toDouble());
  SizedBox get horizontalSizedBox => SizedBox(width: toDouble());
}

extension MediQueryExtension on BuildContext {
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;
  double get height => MediaQuery.of(this).size.height;
}

extension StringNullEmptyExtension on String? {
  bool get isNotNullOrEmpty => this != null && this!.trim().isNotEmpty;
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Travel Assign';

  @override
  String get travel => 'Travel';

  @override
  String get assign => 'Assign';

  @override
  String get select_intrests => 'Select your intrests';

  @override
  String get help_us_intrests => 'Help us know you better — choose at least 2 interests.';

  @override
  String get continue_text => 'Continue';

  @override
  String get saving => 'Saving...';
}

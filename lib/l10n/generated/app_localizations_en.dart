// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String weekNumber(int weekNumber) {
    return 'W $weekNumber';
  }

  @override
  String themeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(mode, {
      'light': 'Light',
      'dark': 'Dark',
      'system': 'System',
      'other': 'Unknown',
    });
    return '$_temp0';
  }

  @override
  String get primeNumberSheetTitle => 'Congrats!';

  @override
  String get primeNumberSheetSubtitle => 'You just found a prime number!';

  @override
  String primeNumberSheetTimeSinceLastPrime(String time) {
    return 'Last time you found a prime number was $time';
  }

  @override
  String get primeNumberSheetFirstTime =>
      'This is the first time you found one!';

  @override
  String get primeNumberDescription =>
      'A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.';

  @override
  String get primeNumberSheetCta => 'Close';

  @override
  String get personalizationSheetTitle => 'Personalization';

  @override
  String get mainColor => 'Main Color';

  @override
  String get gradientColors => 'Gradient Colors';

  @override
  String get animateGradient => 'Animate Gradient';

  @override
  String get animateGradientDescription => 'Enables smooth color animations';

  @override
  String get resetToDefaults => 'Reset';

  @override
  String get saveChanges => 'Save';

  @override
  String get addGradientColor => 'Add Color';

  @override
  String gradientColorIndex(int index) {
    return 'Color $index';
  }
}

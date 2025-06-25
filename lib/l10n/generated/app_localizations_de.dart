// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String weekNumber(int weekNumber) {
    return 'KW $weekNumber';
  }

  @override
  String themeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(mode, {
      'light': 'Hell',
      'dark': 'Dunkel',
      'system': 'System',
      'other': 'Unbekannt',
    });
    return '$_temp0';
  }

  @override
  String get primeNumberSheetTitle => 'Glückwunsch!';

  @override
  String get primeNumberSheetSubtitle =>
      'Du hast gerade eine Primzahl gefunden!';

  @override
  String primeNumberSheetTimeSinceLastPrime(String time) {
    return 'Letzte Primzahl gefunden vor $time';
  }

  @override
  String get primeNumberSheetFirstTime =>
      'Das ist die erste Primzahl, die du gefunden hast!';

  @override
  String get primeNumberDescription =>
      'Eine Primzahl ist eine natürliche Zahl größer als 1, die keine positiven Teiler außer 1 und sich selbst hat.';

  @override
  String get primeNumberSheetCta => 'Schließen';

  @override
  String get personalizationSheetTitle => 'Personalisierung';

  @override
  String get mainColor => 'Hauptfarbe';

  @override
  String get gradientColors => 'Verlaufsfarben';

  @override
  String get animateGradient => 'Verlauf animieren';

  @override
  String get animateGradientDescription => 'Aktiviert sanfte Farbanimationen';

  @override
  String get resetToDefaults => 'Zurücksetzen';

  @override
  String get saveChanges => 'Speichern';

  @override
  String get addGradientColor => 'Farbe hinzufügen';

  @override
  String gradientColorIndex(int index) {
    return 'Farbe $index';
  }
}

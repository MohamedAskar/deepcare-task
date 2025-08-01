import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
  ];

  /// No description provided for @weekNumber.
  ///
  /// In en, this message translates to:
  /// **'W {weekNumber}'**
  String weekNumber(int weekNumber);

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'{mode, select, light{Light} dark{Dark} system{System} other{Unknown}}'**
  String themeMode(String mode);

  /// No description provided for @primeNumberSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Congrats!'**
  String get primeNumberSheetTitle;

  /// No description provided for @primeNumberSheetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You just found a prime number!'**
  String get primeNumberSheetSubtitle;

  /// No description provided for @primeNumberSheetTimeSinceLastPrime.
  ///
  /// In en, this message translates to:
  /// **'Last time you found a prime number was {time}'**
  String primeNumberSheetTimeSinceLastPrime(String time);

  /// No description provided for @primeNumberSheetFirstTime.
  ///
  /// In en, this message translates to:
  /// **'This is the first time you found one!'**
  String get primeNumberSheetFirstTime;

  /// No description provided for @primeNumberDescription.
  ///
  /// In en, this message translates to:
  /// **'A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.'**
  String get primeNumberDescription;

  /// No description provided for @primeNumberSheetCta.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get primeNumberSheetCta;

  /// No description provided for @personalizationSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Personalization'**
  String get personalizationSheetTitle;

  /// No description provided for @mainColor.
  ///
  /// In en, this message translates to:
  /// **'Main Color'**
  String get mainColor;

  /// No description provided for @gradientColors.
  ///
  /// In en, this message translates to:
  /// **'Gradient Colors'**
  String get gradientColors;

  /// No description provided for @animateGradient.
  ///
  /// In en, this message translates to:
  /// **'Animate Gradient'**
  String get animateGradient;

  /// No description provided for @animateGradientDescription.
  ///
  /// In en, this message translates to:
  /// **'Enables smooth color animations'**
  String get animateGradientDescription;

  /// No description provided for @resetToDefaults.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetToDefaults;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveChanges;

  /// No description provided for @addGradientColor.
  ///
  /// In en, this message translates to:
  /// **'Add Color'**
  String get addGradientColor;

  /// No description provided for @gradientColorIndex.
  ///
  /// In en, this message translates to:
  /// **'Color {index}'**
  String gradientColorIndex(int index);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

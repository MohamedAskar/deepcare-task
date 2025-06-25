import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/theme/app_theme.dart';
import 'l10n/generated/app_localizations.dart';
import 'screens/clock/clock_screen.dart';
import 'utils/shared_preferences_provider.dart';
import 'utils/theme_controller_provider.dart';
import 'utils/personalization_controller_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const DeepCareApp(),
    ),
  );
}

class DeepCareApp extends ConsumerWidget {
  const DeepCareApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final personalizationSettings = ref.watch(
      personalizationControllerProvider,
    );

    final theme = AppTheme(
      fontFamily: 'Satoshi',
      mainColor: personalizationSettings.mainColor,
    );

    return MaterialApp(
      title: 'DeepCare Clock',
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('de')],
      home: const ClockScreen(),
    );
  }
}

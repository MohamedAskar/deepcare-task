import 'package:flutter/material.dart';
import 'package:deepcare/utils/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller_provider.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  static const _themeKey = 'themeMode';

  @override
  ThemeMode build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final themeIndex = prefs.getInt(_themeKey);

    if (themeIndex != null &&
        themeIndex >= 0 &&
        themeIndex < ThemeMode.values.length) {
      return ThemeMode.values[themeIndex];
    }

    return ThemeMode.system;
  }

  Future<void> _saveThemeMode(ThemeMode themeMode) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setInt(_themeKey, themeMode.index);
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    state = themeMode;
    await _saveThemeMode(themeMode);
  }
}

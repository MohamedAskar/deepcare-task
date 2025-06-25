import 'dart:convert';
import 'package:deepcare/utils/color_service.dart';
import 'package:flutter/material.dart';
import 'package:deepcare/core/models/personalization_settings.dart';
import 'package:deepcare/utils/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'personalization_controller_provider.g.dart';

@riverpod
class PersonalizationController extends _$PersonalizationController {
  static const _settingsKey = 'personalizationSettings';

  @override
  PersonalizationSettings build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final settingsJson = prefs.getString(_settingsKey);

    if (settingsJson != null) {
      try {
        final Map<String, dynamic> json = jsonDecode(settingsJson);
        return PersonalizationSettings.fromJson(json);
      } catch (e) {
        // If there's an error parsing, return default settings
        return const PersonalizationSettings();
      }
    }

    return const PersonalizationSettings();
  }

  Future<void> _saveSettings(PersonalizationSettings settings) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final settingsJson = jsonEncode(settings.toJson());
    await prefs.setString(_settingsKey, settingsJson);
  }

  Future<void> updateMainColor(Color color) async {
    final newSettings = state.copyWith(mainHexColor: ColorService.toHex(color));
    state = newSettings;
    await _saveSettings(newSettings);
  }

  Future<void> updateGradientColors(List<Color> colors) async {
    final newSettings = state.copyWith(
      gradientHexColors: colors.map(ColorService.toHex).toList(),
    );
    state = newSettings;
    await _saveSettings(newSettings);
  }

  Future<void> updateAnimatedGradient(bool animated) async {
    final newSettings = state.copyWith(animated: animated);
    state = newSettings;
    await _saveSettings(newSettings);
  }

  Future<void> updateSettings(PersonalizationSettings settings) async {
    state = settings;
    await _saveSettings(settings);
  }
}

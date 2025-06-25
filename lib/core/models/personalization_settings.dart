import 'package:deepcare/utils/color_service.dart';
import 'package:deepcare/widgets/spinning_animation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personalization_settings.freezed.dart';
part 'personalization_settings.g.dart';

@freezed
class PersonalizationSettings with _$PersonalizationSettings {
  const PersonalizationSettings._();
  const factory PersonalizationSettings({
    @Default(true) bool animated,
    @Default([]) List<String> gradientHexColors,
    @Default('#6F1A07') String mainHexColor,
  }) = _PersonalizationSettings;

  factory PersonalizationSettings.fromJson(Map<String, dynamic> json) =>
      _$PersonalizationSettingsFromJson(json);

  List<Color> get gradientColors =>
      gradientHexColors.map((hex) => ColorService.fromHex(hex)).toList();

  Color get mainColor => ColorService.fromHex(mainHexColor);

  Gradient? get gradient {
    if (gradientColors.isEmpty || gradientColors.length < 2) return null;

    return LinearGradient(
      colors: gradientColors,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  SpinningAnimationColors? get spinningAnimationColors {
    if (!animated) return null;

    final topLeftColor = gradientColors.firstOrNull;
    final topRightColor = gradientColors.elementAtOrNull(1);
    final bottomLeftColor = gradientColors.elementAtOrNull(2);
    final bottomRightColor = gradientColors.elementAtOrNull(3);

    return SpinningAnimationColors(
      topLeftColor: topLeftColor,
      topRightColor: topRightColor,
      bottomLeftColor: bottomLeftColor,
      bottomRightColor: bottomRightColor,
    );
  }
}

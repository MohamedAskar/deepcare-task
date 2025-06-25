// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalization_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalizationSettingsImpl _$$PersonalizationSettingsImplFromJson(
  Map<String, dynamic> json,
) => _$PersonalizationSettingsImpl(
  animated: json['animated'] as bool? ?? true,
  gradientHexColors:
      (json['gradientHexColors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  mainHexColor: json['mainHexColor'] as String? ?? '#6F1A07',
);

Map<String, dynamic> _$$PersonalizationSettingsImplToJson(
  _$PersonalizationSettingsImpl instance,
) => <String, dynamic>{
  'animated': instance.animated,
  'gradientHexColors': instance.gradientHexColors,
  'mainHexColor': instance.mainHexColor,
};

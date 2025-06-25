// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personalization_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PersonalizationSettings _$PersonalizationSettingsFromJson(
  Map<String, dynamic> json,
) {
  return _PersonalizationSettings.fromJson(json);
}

/// @nodoc
mixin _$PersonalizationSettings {
  bool get animated => throw _privateConstructorUsedError;
  List<String> get gradientHexColors => throw _privateConstructorUsedError;
  String get mainHexColor => throw _privateConstructorUsedError;

  /// Serializes this PersonalizationSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonalizationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalizationSettingsCopyWith<PersonalizationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalizationSettingsCopyWith<$Res> {
  factory $PersonalizationSettingsCopyWith(
    PersonalizationSettings value,
    $Res Function(PersonalizationSettings) then,
  ) = _$PersonalizationSettingsCopyWithImpl<$Res, PersonalizationSettings>;
  @useResult
  $Res call({
    bool animated,
    List<String> gradientHexColors,
    String mainHexColor,
  });
}

/// @nodoc
class _$PersonalizationSettingsCopyWithImpl<
  $Res,
  $Val extends PersonalizationSettings
>
    implements $PersonalizationSettingsCopyWith<$Res> {
  _$PersonalizationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonalizationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animated = null,
    Object? gradientHexColors = null,
    Object? mainHexColor = null,
  }) {
    return _then(
      _value.copyWith(
            animated: null == animated
                ? _value.animated
                : animated // ignore: cast_nullable_to_non_nullable
                      as bool,
            gradientHexColors: null == gradientHexColors
                ? _value.gradientHexColors
                : gradientHexColors // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            mainHexColor: null == mainHexColor
                ? _value.mainHexColor
                : mainHexColor // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PersonalizationSettingsImplCopyWith<$Res>
    implements $PersonalizationSettingsCopyWith<$Res> {
  factory _$$PersonalizationSettingsImplCopyWith(
    _$PersonalizationSettingsImpl value,
    $Res Function(_$PersonalizationSettingsImpl) then,
  ) = __$$PersonalizationSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool animated,
    List<String> gradientHexColors,
    String mainHexColor,
  });
}

/// @nodoc
class __$$PersonalizationSettingsImplCopyWithImpl<$Res>
    extends
        _$PersonalizationSettingsCopyWithImpl<
          $Res,
          _$PersonalizationSettingsImpl
        >
    implements _$$PersonalizationSettingsImplCopyWith<$Res> {
  __$$PersonalizationSettingsImplCopyWithImpl(
    _$PersonalizationSettingsImpl _value,
    $Res Function(_$PersonalizationSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PersonalizationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animated = null,
    Object? gradientHexColors = null,
    Object? mainHexColor = null,
  }) {
    return _then(
      _$PersonalizationSettingsImpl(
        animated: null == animated
            ? _value.animated
            : animated // ignore: cast_nullable_to_non_nullable
                  as bool,
        gradientHexColors: null == gradientHexColors
            ? _value._gradientHexColors
            : gradientHexColors // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        mainHexColor: null == mainHexColor
            ? _value.mainHexColor
            : mainHexColor // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalizationSettingsImpl extends _PersonalizationSettings {
  const _$PersonalizationSettingsImpl({
    this.animated = true,
    final List<String> gradientHexColors = const [],
    this.mainHexColor = '#6F1A07',
  }) : _gradientHexColors = gradientHexColors,
       super._();

  factory _$PersonalizationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalizationSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool animated;
  final List<String> _gradientHexColors;
  @override
  @JsonKey()
  List<String> get gradientHexColors {
    if (_gradientHexColors is EqualUnmodifiableListView)
      return _gradientHexColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gradientHexColors);
  }

  @override
  @JsonKey()
  final String mainHexColor;

  @override
  String toString() {
    return 'PersonalizationSettings(animated: $animated, gradientHexColors: $gradientHexColors, mainHexColor: $mainHexColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalizationSettingsImpl &&
            (identical(other.animated, animated) ||
                other.animated == animated) &&
            const DeepCollectionEquality().equals(
              other._gradientHexColors,
              _gradientHexColors,
            ) &&
            (identical(other.mainHexColor, mainHexColor) ||
                other.mainHexColor == mainHexColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    animated,
    const DeepCollectionEquality().hash(_gradientHexColors),
    mainHexColor,
  );

  /// Create a copy of PersonalizationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalizationSettingsImplCopyWith<_$PersonalizationSettingsImpl>
  get copyWith =>
      __$$PersonalizationSettingsImplCopyWithImpl<
        _$PersonalizationSettingsImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalizationSettingsImplToJson(this);
  }
}

abstract class _PersonalizationSettings extends PersonalizationSettings {
  const factory _PersonalizationSettings({
    final bool animated,
    final List<String> gradientHexColors,
    final String mainHexColor,
  }) = _$PersonalizationSettingsImpl;
  const _PersonalizationSettings._() : super._();

  factory _PersonalizationSettings.fromJson(Map<String, dynamic> json) =
      _$PersonalizationSettingsImpl.fromJson;

  @override
  bool get animated;
  @override
  List<String> get gradientHexColors;
  @override
  String get mainHexColor;

  /// Create a copy of PersonalizationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalizationSettingsImplCopyWith<_$PersonalizationSettingsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

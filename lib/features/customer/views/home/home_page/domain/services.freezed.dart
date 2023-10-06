// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServicesData _$ServicesDataFromJson(Map<String, dynamic> json) {
  return _ServicesData.fromJson(json);
}

/// @nodoc
mixin _$ServicesData {
  String get name => throw _privateConstructorUsedError;
  String get descrip => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServicesDataCopyWith<ServicesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesDataCopyWith<$Res> {
  factory $ServicesDataCopyWith(
          ServicesData value, $Res Function(ServicesData) then) =
      _$ServicesDataCopyWithImpl<$Res, ServicesData>;
  @useResult
  $Res call({String name, String descrip, String icon});
}

/// @nodoc
class _$ServicesDataCopyWithImpl<$Res, $Val extends ServicesData>
    implements $ServicesDataCopyWith<$Res> {
  _$ServicesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? descrip = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      descrip: null == descrip
          ? _value.descrip
          : descrip // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServicesDataImplCopyWith<$Res>
    implements $ServicesDataCopyWith<$Res> {
  factory _$$ServicesDataImplCopyWith(
          _$ServicesDataImpl value, $Res Function(_$ServicesDataImpl) then) =
      __$$ServicesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String descrip, String icon});
}

/// @nodoc
class __$$ServicesDataImplCopyWithImpl<$Res>
    extends _$ServicesDataCopyWithImpl<$Res, _$ServicesDataImpl>
    implements _$$ServicesDataImplCopyWith<$Res> {
  __$$ServicesDataImplCopyWithImpl(
      _$ServicesDataImpl _value, $Res Function(_$ServicesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? descrip = null,
    Object? icon = null,
  }) {
    return _then(_$ServicesDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      descrip: null == descrip
          ? _value.descrip
          : descrip // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServicesDataImpl implements _ServicesData {
  const _$ServicesDataImpl(
      {required this.name, required this.descrip, required this.icon});

  factory _$ServicesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServicesDataImplFromJson(json);

  @override
  final String name;
  @override
  final String descrip;
  @override
  final String icon;

  @override
  String toString() {
    return 'ServicesData(name: $name, descrip: $descrip, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicesDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.descrip, descrip) || other.descrip == descrip) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, descrip, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicesDataImplCopyWith<_$ServicesDataImpl> get copyWith =>
      __$$ServicesDataImplCopyWithImpl<_$ServicesDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServicesDataImplToJson(
      this,
    );
  }
}

abstract class _ServicesData implements ServicesData {
  const factory _ServicesData(
      {required final String name,
      required final String descrip,
      required final String icon}) = _$ServicesDataImpl;

  factory _ServicesData.fromJson(Map<String, dynamic> json) =
      _$ServicesDataImpl.fromJson;

  @override
  String get name;
  @override
  String get descrip;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$ServicesDataImplCopyWith<_$ServicesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

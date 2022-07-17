// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleDay _$ScheduleDayFromJson(Map<String, dynamic> json) {
  return _ScheduleDay.fromJson(json);
}

/// @nodoc
mixin _$ScheduleDay {
  String get name => throw _privateConstructorUsedError;
  List<Subject> get subjects => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleDayCopyWith<ScheduleDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleDayCopyWith<$Res> {
  factory $ScheduleDayCopyWith(
          ScheduleDay value, $Res Function(ScheduleDay) then) =
      _$ScheduleDayCopyWithImpl<$Res>;
  $Res call({String name, List<Subject> subjects});
}

/// @nodoc
class _$ScheduleDayCopyWithImpl<$Res> implements $ScheduleDayCopyWith<$Res> {
  _$ScheduleDayCopyWithImpl(this._value, this._then);

  final ScheduleDay _value;
  // ignore: unused_field
  final $Res Function(ScheduleDay) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subjects: subjects == freezed
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<Subject>,
    ));
  }
}

/// @nodoc
abstract class _$$_ScheduleDayCopyWith<$Res>
    implements $ScheduleDayCopyWith<$Res> {
  factory _$$_ScheduleDayCopyWith(
          _$_ScheduleDay value, $Res Function(_$_ScheduleDay) then) =
      __$$_ScheduleDayCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<Subject> subjects});
}

/// @nodoc
class __$$_ScheduleDayCopyWithImpl<$Res> extends _$ScheduleDayCopyWithImpl<$Res>
    implements _$$_ScheduleDayCopyWith<$Res> {
  __$$_ScheduleDayCopyWithImpl(
      _$_ScheduleDay _value, $Res Function(_$_ScheduleDay) _then)
      : super(_value, (v) => _then(v as _$_ScheduleDay));

  @override
  _$_ScheduleDay get _value => super._value as _$_ScheduleDay;

  @override
  $Res call({
    Object? name = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_$_ScheduleDay(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subjects: subjects == freezed
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<Subject>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ScheduleDay implements _ScheduleDay {
  const _$_ScheduleDay(
      {this.name = '', final List<Subject> subjects = const []})
      : _subjects = subjects;

  factory _$_ScheduleDay.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleDayFromJson(json);

  @override
  @JsonKey()
  final String name;
  final List<Subject> _subjects;
  @override
  @JsonKey()
  List<Subject> get subjects {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  @override
  String toString() {
    return 'ScheduleDay(name: $name, subjects: $subjects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScheduleDay &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_subjects));

  @JsonKey(ignore: true)
  @override
  _$$_ScheduleDayCopyWith<_$_ScheduleDay> get copyWith =>
      __$$_ScheduleDayCopyWithImpl<_$_ScheduleDay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleDayToJson(this);
  }
}

abstract class _ScheduleDay implements ScheduleDay {
  const factory _ScheduleDay(
      {final String name, final List<Subject> subjects}) = _$_ScheduleDay;

  factory _ScheduleDay.fromJson(Map<String, dynamic> json) =
      _$_ScheduleDay.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<Subject> get subjects => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleDayCopyWith<_$_ScheduleDay> get copyWith =>
      throw _privateConstructorUsedError;
}

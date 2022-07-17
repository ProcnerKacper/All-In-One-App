// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
mixin _$Subject {
  @JsonKey(ignore: true)
  String get id => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay get startTime => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay get endTime => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  String? get subjectType => throw _privateConstructorUsedError;
  String? get professor => throw _privateConstructorUsedError;
  String? get lectureHall => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      String subject,
      @TimeOfDayConverter() TimeOfDay startTime,
      @TimeOfDayConverter() TimeOfDay endTime,
      double? duration,
      String? subjectType,
      String? professor,
      String? lectureHall});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res> implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  final Subject _value;
  // ignore: unused_field
  final $Res Function(Subject) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? subject = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? duration = freezed,
    Object? subjectType = freezed,
    Object? professor = freezed,
    Object? lectureHall = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      subjectType: subjectType == freezed
          ? _value.subjectType
          : subjectType // ignore: cast_nullable_to_non_nullable
              as String?,
      professor: professor == freezed
          ? _value.professor
          : professor // ignore: cast_nullable_to_non_nullable
              as String?,
      lectureHall: lectureHall == freezed
          ? _value.lectureHall
          : lectureHall // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SubjectCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$_SubjectCopyWith(
          _$_Subject value, $Res Function(_$_Subject) then) =
      __$$_SubjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String id,
      String subject,
      @TimeOfDayConverter() TimeOfDay startTime,
      @TimeOfDayConverter() TimeOfDay endTime,
      double? duration,
      String? subjectType,
      String? professor,
      String? lectureHall});
}

/// @nodoc
class __$$_SubjectCopyWithImpl<$Res> extends _$SubjectCopyWithImpl<$Res>
    implements _$$_SubjectCopyWith<$Res> {
  __$$_SubjectCopyWithImpl(_$_Subject _value, $Res Function(_$_Subject) _then)
      : super(_value, (v) => _then(v as _$_Subject));

  @override
  _$_Subject get _value => super._value as _$_Subject;

  @override
  $Res call({
    Object? id = freezed,
    Object? subject = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? duration = freezed,
    Object? subjectType = freezed,
    Object? professor = freezed,
    Object? lectureHall = freezed,
  }) {
    return _then(_$_Subject(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      subjectType: subjectType == freezed
          ? _value.subjectType
          : subjectType // ignore: cast_nullable_to_non_nullable
              as String?,
      professor: professor == freezed
          ? _value.professor
          : professor // ignore: cast_nullable_to_non_nullable
              as String?,
      lectureHall: lectureHall == freezed
          ? _value.lectureHall
          : lectureHall // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Subject implements _Subject {
  const _$_Subject(
      {@JsonKey(ignore: true)
          this.id = '',
      this.subject = '',
      @TimeOfDayConverter()
          this.startTime = const TimeOfDay(hour: 8, minute: 0),
      @TimeOfDayConverter()
          this.endTime = const TimeOfDay(hour: 20, minute: 0),
      this.duration,
      this.subjectType,
      this.professor,
      this.lectureHall});

  factory _$_Subject.fromJson(Map<String, dynamic> json) =>
      _$$_SubjectFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  @JsonKey()
  final String subject;
  @override
  @JsonKey()
  @TimeOfDayConverter()
  final TimeOfDay startTime;
  @override
  @JsonKey()
  @TimeOfDayConverter()
  final TimeOfDay endTime;
  @override
  final double? duration;
  @override
  final String? subjectType;
  @override
  final String? professor;
  @override
  final String? lectureHall;

  @override
  String toString() {
    return 'Subject(id: $id, subject: $subject, startTime: $startTime, endTime: $endTime, duration: $duration, subjectType: $subjectType, professor: $professor, lectureHall: $lectureHall)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subject &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.subject, subject) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality()
                .equals(other.subjectType, subjectType) &&
            const DeepCollectionEquality().equals(other.professor, professor) &&
            const DeepCollectionEquality()
                .equals(other.lectureHall, lectureHall));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(subject),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(subjectType),
      const DeepCollectionEquality().hash(professor),
      const DeepCollectionEquality().hash(lectureHall));

  @JsonKey(ignore: true)
  @override
  _$$_SubjectCopyWith<_$_Subject> get copyWith =>
      __$$_SubjectCopyWithImpl<_$_Subject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubjectToJson(this);
  }
}

abstract class _Subject implements Subject {
  const factory _Subject(
      {@JsonKey(ignore: true) final String id,
      final String subject,
      @TimeOfDayConverter() final TimeOfDay startTime,
      @TimeOfDayConverter() final TimeOfDay endTime,
      final double? duration,
      final String? subjectType,
      final String? professor,
      final String? lectureHall}) = _$_Subject;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$_Subject.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id => throw _privateConstructorUsedError;
  @override
  String get subject => throw _privateConstructorUsedError;
  @override
  @TimeOfDayConverter()
  TimeOfDay get startTime => throw _privateConstructorUsedError;
  @override
  @TimeOfDayConverter()
  TimeOfDay get endTime => throw _privateConstructorUsedError;
  @override
  double? get duration => throw _privateConstructorUsedError;
  @override
  String? get subjectType => throw _privateConstructorUsedError;
  @override
  String? get professor => throw _privateConstructorUsedError;
  @override
  String? get lectureHall => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SubjectCopyWith<_$_Subject> get copyWith =>
      throw _privateConstructorUsedError;
}

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.freezed.dart';
part 'subject.g.dart';

@freezed
class Subject with _$Subject {
  const factory Subject({
    @JsonKey(ignore: true) @Default('') String id,
    @Default('') String subject,
    @Default(TimeOfDay(hour: 8, minute: 0))
    @TimeOfDayConverter()
        TimeOfDay startTime,
    @Default(TimeOfDay(hour: 20, minute: 0))
    @TimeOfDayConverter()
        TimeOfDay endTime,
    double? duration,
    String? subjectType,
    String? professor,
    String? lectureHall,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

class TimeOfDayConverter
    implements JsonConverter<TimeOfDay, Map<String, dynamic>> {
  const TimeOfDayConverter();

  @override
  Map<String, dynamic> toJson(TimeOfDay timeOfDay) => {
        'hour': timeOfDay.hour,
        'minute': timeOfDay.minute,
      };

  @override
  TimeOfDay fromJson(Map<String, dynamic> date) => TimeOfDay(
        hour: date['hour'],
        minute: date['minute'],
      );
}

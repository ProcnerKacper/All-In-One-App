// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Subject _$$_SubjectFromJson(Map<String, dynamic> json) => _$_Subject(
      subject: json['subject'] as String? ?? '',
      startTime: json['startTime'] == null
          ? const TimeOfDay(hour: 8, minute: 0)
          : const TimeOfDayConverter()
              .fromJson(json['startTime'] as Map<String, dynamic>),
      endTime: json['endTime'] == null
          ? const TimeOfDay(hour: 20, minute: 0)
          : const TimeOfDayConverter()
              .fromJson(json['endTime'] as Map<String, dynamic>),
      duration: (json['duration'] as num?)?.toDouble(),
      subjectType: json['subjectType'] as String?,
      professor: json['professor'] as String?,
      lectureHall: json['lectureHall'] as String?,
    );

Map<String, dynamic> _$$_SubjectToJson(_$_Subject instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'startTime': const TimeOfDayConverter().toJson(instance.startTime),
      'endTime': const TimeOfDayConverter().toJson(instance.endTime),
      'duration': instance.duration,
      'subjectType': instance.subjectType,
      'professor': instance.professor,
      'lectureHall': instance.lectureHall,
    };

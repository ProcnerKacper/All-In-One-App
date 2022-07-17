// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleDay _$$_ScheduleDayFromJson(Map<String, dynamic> json) =>
    _$_ScheduleDay(
      name: json['name'] as String? ?? '',
      subjects: (json['subjects'] as List<dynamic>?)
              ?.map((e) => Subject.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ScheduleDayToJson(_$_ScheduleDay instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subjects': instance.subjects.map((e) => e.toJson()).toList(),
    };

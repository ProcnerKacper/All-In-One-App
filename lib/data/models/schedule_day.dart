import 'package:allinone/data/models/subject.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_day.freezed.dart';
part 'schedule_day.g.dart';

@freezed
class ScheduleDay with _$ScheduleDay {
  @JsonSerializable(explicitToJson: true)
  const factory ScheduleDay({
    @Default('') String name,
    @Default([]) List<Subject> subjects,
  }) = _ScheduleDay;

  factory ScheduleDay.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDayFromJson(json);
}

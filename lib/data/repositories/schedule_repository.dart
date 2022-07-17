import '../models/schedule_day.dart';

abstract class ScheduleRepository {
  Future<Map<String, ScheduleDay>> getSubjects();
  Future<void> removeDay(String day);
  Future<ScheduleDay> getDay(String day);

  Future<void> createDay(ScheduleDay scheduleDay);

  Future<void> updateDay(ScheduleDay scheduleDay);
}

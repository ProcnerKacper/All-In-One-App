import 'package:allinone/data/models/schedule_day.dart';
import 'package:injectable/injectable.dart';

import '../models/subject.dart';
import '../sources/db_source.dart';
import 'schedule_repository.dart';

@Injectable(as: ScheduleRepository)
class ScheduleRepositoryImpl implements ScheduleRepository {
  final DBSource _dbSource;
  const ScheduleRepositoryImpl(this._dbSource);

  @override
  Future<Map<String, ScheduleDay>> getSubjects() async {
    return await _dbSource.getSchedule();
  }

  @override
  Future<void> removeDay(String day) async {
    await _dbSource.removeDay(day);
  }

  @override
  Future<ScheduleDay> getDay(String day) {
    return _dbSource.getDay(day);
  }

  @override
  Future<void> createDay(ScheduleDay scheduleDay) async {
    await _dbSource.createDay(scheduleDay);
  }

  @override
  Future<void> updateDay(ScheduleDay scheduleDay) async {
    await _dbSource.updateDay(scheduleDay);
  }
}

import 'package:flutter/material.dart';

import '../helpers/DBHelper.dart';
import '../models/subject.dart';

class ScheduleProvider with ChangeNotifier {
  Map<String, List<Subject>> _schedule = {
    'Monday': [],
    'Tuesday': [],
    'Wednesday': [],
    'Thursday': [],
    'Friday': [],
  };

  Map<String, List<Subject>> get schedule {
    return {..._schedule};
  }

  List<Subject> scheduleDay(String name) {
    return [..._schedule[name]];
  }

  Future<void> fetchSchedule() async {
    Map<String, List<Subject>> schedule = await DBHelper.getSubjects();
    _schedule = schedule;
    notifyListeners();
  }

  Future<void> addDay(List<Subject> subjects, String day) async {
    double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;
    subjects
        .sort((a, b) => toDouble(a.startTime).compareTo(toDouble(b.startTime)));
    List<Map<String, dynamic>> bodyData = [];
    subjects.forEach((sub) {
      int hour = sub.endTime.hour - sub.startTime.hour;
      double minutes = (sub.endTime.minute - sub.startTime.minute) / 100;
      sub.duration = hour + minutes;
      Map<String, dynamic> body = {
        'subcject': sub.subcject,
        'startTime': {
          'hour': sub.startTime.hour,
          'minute': sub.startTime.minute,
        },
        'endTime': {
          'hour': sub.endTime.hour,
          'minute': sub.endTime.minute,
        },
        'duration': sub.duration,
        'lectureHall': sub.lectureHall,
        'subcjectType': sub.subcjectType,
        'professor': sub.professor,
      };
      bodyData.add(body);
    });
    try {
      await DBHelper.addDay(bodyData, day);
      fetchSchedule();
    } catch (e) {}
  }

  Future<void> removeDay(String dayName) async {
    await DBHelper.removeDay(dayName);
    fetchSchedule();
  }
}

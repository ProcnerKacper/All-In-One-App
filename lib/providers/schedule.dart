import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/subject.dart';

class Schedule with ChangeNotifier {
  final _apiKey = 'AIzaSyDKMiPNTvq61BONtKRKJcXUjCCFkKg_65A';
  Map<String, List<Subject>> _schedule = {
    'Monday': [],
    'Tuesday': [],
    'Wednesday': [],
    'Thursday': [],
    'Friday': [],
  };

  Map<String, List<Subject>> get schedule {
    return _schedule;
  }

  Future<void> addDay(List<Subject> subjects, String day) async {
    double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;
    subjects
        .sort((a, b) => toDouble(a.startTime).compareTo(toDouble(b.startTime)));
    var bodyData = [];
    subjects.forEach((sub) {
      int hour = sub.endTime.hour - sub.startTime.hour;
      double minutes = (sub.endTime.minute - sub.startTime.minute) / 100;
      sub.duration = hour + minutes;
      dynamic body = {
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
      await http.put('https://flutter-246b3.firebaseio.com/subjects/$day.json',
          body: json.encode(bodyData));
      _schedule[day] = subjects;
      notifyListeners();
    } catch (e) {}
  }
}

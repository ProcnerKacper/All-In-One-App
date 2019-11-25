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

  Future<void> fetchSchedule() async {
    final res =
        await http.get('https://flutter-246b3.firebaseio.com/subjects.json');
    Map<String, List<Subject>> schedule = {
      'Monday': [],
      'Tuesday': [],
      'Wednesday': [],
      'Thursday': [],
      'Friday': [],
    };
    var data = json.decode(res.body);
    if (data != null) {
      for (var item in data.keys) {
        List<Subject> list = [];
        for (var prop in data[item]) {
          list.add(
            Subject(
              subcject: prop['subcject'],
              startTime: TimeOfDay(
                hour: prop['startTime']['hour'],
                minute: prop['startTime']['minute'],
              ),
              endTime: TimeOfDay(
                hour: prop['endTime']['hour'],
                minute: prop['endTime']['minute'],
              ),
              duration: prop['duration'],
              lectureHall: prop['lectureHall'],
              subcjectType: prop['subcjectType'],
              professor: prop['professor'],
            ),
          );
        }
        schedule[item] = list;
      }
      _schedule = schedule;
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';

class Subject {
  String subcject;
  TimeOfDay startTime;
  TimeOfDay endTime;
  double duration;
  String subcjectType;
  String professor;
  String lectureHall;

  Subject({
    this.subcject = '',
    this.startTime = const TimeOfDay(hour: 8, minute: 0),
    this.endTime = const TimeOfDay(hour: 20, minute: 0),
    @required this.duration,
    @required this.subcjectType,
    @required this.professor,
    @required this.lectureHall,
  });
}

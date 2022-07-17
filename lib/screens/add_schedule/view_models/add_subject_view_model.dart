import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/subject.dart';
import 'add_schedule_day_view_model.dart';

@injectable
class AddSubjectViewModel extends ChangeNotifier {
  List<String> get typeList => ['Wykład', 'Ćwiczenia'];
  late Subject _subject;
  late AddScheduleDayViewModel _addScheduleDayViewModel;

  Subject get subject => _subject;
  String? get type => _subject.subjectType;
  String? get subjectName => _subject.subject;

  String? get professor => _subject.professor;

  String? get lectureHall => _subject.lectureHall;

  TimeOfDay get startTime => _subject.startTime;
  TimeOfDay get endTime => _subject.endTime;

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  init({
    required Subject sub,
    required AddScheduleDayViewModel addScheduleDayViewModel,
  }) {
    _addScheduleDayViewModel = addScheduleDayViewModel;
    _subject = sub;
    notifyListeners();
  }

  String? validateSubjectType(String? val) =>
      val == null ? 'Nie wybrano typu zajęć!' : null;

  void onTypeChange(String? value) {
    if (value != null) {
      _subject = _subject.copyWith(subjectType: value);
      _addScheduleDayViewModel.updateSubject(_subject);
      notifyListeners();
    }
  }

  String? validateSubjectName(String? value) =>
      value == '' ? 'Nie podano nazwy przedmiotu!' : null;

  void changeSubjectName(String value) {
    _subject = _subject.copyWith(subject: value);
    _addScheduleDayViewModel.updateSubject(_subject);
    notifyListeners();
  }

  void changeProfessor(String value) {
    _subject = _subject.copyWith(professor: value);
    _addScheduleDayViewModel.updateSubject(_subject);
    notifyListeners();
  }

  void changeLectureHall(String value) {
    _subject = _subject.copyWith(lectureHall: value);
    _addScheduleDayViewModel.updateSubject(_subject);
    notifyListeners();
  }

  void changeEndTime(TimeOfDay? value) {
    if (value == null) return;
    _subject = _subject.copyWith(endTime: value);
    _addScheduleDayViewModel.updateSubject(_subject);
    notifyListeners();
  }

  void changeStartTime(TimeOfDay? value) {
    if (value == null) return;
    _subject = _subject.copyWith(startTime: value);
    _addScheduleDayViewModel.updateSubject(_subject);
    notifyListeners();
  }
}

import 'package:allinone/data/models/schedule_day.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../core/injectable/injection.dart';
import '../../../core/router/router.dart';
import '../../../data/models/subject.dart';
import '../../../data/repositories/schedule_repository.dart';

@injectable
class AddScheduleDayViewModel extends ChangeNotifier {
  final _scheduleRepository = getIt<ScheduleRepository>();
  final _navigator = getIt<AppRouter>();
  late ScheduleDay _scheduleDay;
  String? _initialKey;
  final List<Subject> _listOfTextForm = [];

  get isCreateMode => _initialKey == null;

  String? get pickedDay => _initialKey;

  List<Subject> get listOfTextForm => _listOfTextForm;
  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  void init({String? key}) async {
    if (key == null) {
      _scheduleDay = const ScheduleDay();
    } else {
      _scheduleDay = await _scheduleRepository.getDay(key);
      const uuid = Uuid();
      _listOfTextForm.addAll(
        _scheduleDay.subjects.map((el) => el.copyWith(id: uuid.v4())),
      );
    }
    _initialKey = key;
    notifyListeners();
  }

  void onSave(GlobalKey<FormState> key) {
    if (key.currentState?.validate() ?? false) {
      List<Subject> list = [..._listOfTextForm];
      list.sort(
          (a, b) => toDouble(a.startTime).compareTo(toDouble(b.startTime)));
      list = list.map((sub) {
        int hour = sub.endTime.hour - sub.startTime.hour;
        double minutes = (sub.endTime.minute - sub.startTime.minute) / 100;
        return sub.copyWith(duration: hour + minutes);
      }).toList();
      final day = _scheduleDay.copyWith(subjects: list);
      if (isCreateMode) {
        _scheduleRepository.createDay(day);
      } else {
        _scheduleRepository.updateDay(day);
      }
      _navigator.pop();
    }
  }

  void addSubject() {
    const uuid = Uuid();
    _listOfTextForm.add(Subject(id: uuid.v4().toString()));
    notifyListeners();
  }

  String? validatePickedDay(String? value) =>
      value == null ? 'Nie wybrano dnia!' : null;

  void changePickedDay(String? value) {
    if (value == null) return;
    _scheduleDay = _scheduleDay.copyWith(name: value);
    notifyListeners();
  }

  removeSubject(Subject subject) {
    final index = _listOfTextForm.indexWhere((sub) => sub.id == subject.id);
    _listOfTextForm.removeAt(index);
    notifyListeners();
  }

  void updateSubject(Subject subject) {
    final index = _listOfTextForm.indexWhere((sub) => sub.id == subject.id);
    _listOfTextForm[index] = subject;
    notifyListeners();
  }
}

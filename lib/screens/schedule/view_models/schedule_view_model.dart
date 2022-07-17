import 'package:allinone/data/models/schedule_day.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../core/injectable/injection.dart';
import '../../../core/router/router.dart';
import '../../../data/repositories/schedule_repository.dart';
import '../../../data/models/days.dart';

enum Direction { forward, backward }

enum DayAction { create, edit, delete }

@injectable
class ScheduleViewModel extends ChangeNotifier {
  final _navigator = getIt<AppRouter>();
  final _scheduleRepository = getIt<ScheduleRepository>();
  final String _today = DateFormat.EEEE().format(DateTime.now());

  late String _pickedDay;
  late Map<String, ScheduleDay> _schedule;

  double _startPosition = 0;
  double _updatePosition = 0;
  bool _loading = true;

  String get pickedDay => _pickedDay;
  bool get loading => _loading;
  Map<String, ScheduleDay> get schedule => _schedule;

  void init() async {
    _pickedDay = Days.getDay(_today)?.isEmpty ?? false ? _today : 'Monday';
    _schedule = await _scheduleRepository.getSubjects();
    _loading = false;
    notifyListeners();
  }

  void changeDay(Direction direction) {
    if (direction == Direction.forward) {
      _pickedDay = Days.getNextDay(_pickedDay);
    } else {
      _pickedDay = Days.getPrevDay(_pickedDay);
    }
    notifyListeners();
  }

  void editDay(DayAction? response) {
    if (response != null) {
      switch (response) {
        case DayAction.create:
          _navigator.navigate(AddScheduleDayScreenRoute());
          break;
        case DayAction.edit:
          _navigator.navigate(AddScheduleDayScreenRoute(dayName: _pickedDay));
          break;
        case DayAction.delete:
          _scheduleRepository.removeDay(_pickedDay);
          init();
          break;
        default:
      }
    }
  }

  void onHorizontalDragStart(DragStartDetails details) {
    _startPosition = details.globalPosition.dx;
  }

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    _updatePosition = details.globalPosition.dx;
  }

  void onHorizontalDragEnd(DragEndDetails details) {
    double distance = _updatePosition - _startPosition;
    if (distance > 80) {
      changeDay(Direction.backward);
    } else if (distance < -80) {
      changeDay(Direction.forward);
    }
    _updatePosition = 0.0;
    _startPosition = 0.0;
  }
}

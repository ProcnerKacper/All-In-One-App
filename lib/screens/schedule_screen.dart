import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'add_schedule_day_screen.dart';
import '../models/days.dart';
import '../providers/schedule.dart';
import '../widgets/day_schedule.dart';
import '../widgets/day_switcher.dart';
import '../widgets/app_drawer.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  static final String today = DateFormat.EEEE().format(DateTime.now());
  String _pickedDay = Day.containsKey(today) ? today : 'Monday';
  bool isLoading = true;
  String direction;

  void _changeDay(String direction) {
    if (direction == 'forward') {
      int dayIndex = Days.indexOf(_pickedDay) + 1;
      if (dayIndex > 4) {
        dayIndex = 0;
      }
      setState(() {
        _pickedDay = Days[dayIndex];
      });
    } else {
      int dayIndex = Days.indexOf(_pickedDay) - 1;
      if (dayIndex < 0) {
        dayIndex = 4;
      }
      setState(() => _pickedDay = Days[dayIndex]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Plan Lekcji'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () =>
            Navigator.of(context).pushNamed(AddScheduleDayScreen.routeName),
      ),
      body: FutureBuilder(
          future: Provider.of<Schedule>(context, listen: false).fetchSchedule(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              print(dataSnapshot.connectionState);
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                return Center(
                  child: Text('An error occurred!'),
                );
              } else {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onPanEnd: (details) {
                    direction = '';
                  },
                  onPanUpdate: (details) {
                    if (details.delta.dx < 0 && direction != 'forward') {
                      direction = 'forward';
                      _changeDay('forward');
                    }
                    if (details.delta.dx > 0 && direction != 'back') {
                      direction = 'back';
                      _changeDay('back');
                    }
                  },
                  child: Consumer<Schedule>(
                    builder: (ctx, schedule, child) => Column(
                      children: [
                        child,
                        Expanded(
                          child: SingleChildScrollView(
                            child: AnimatedSwitcher(
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return ScaleTransition(
                                    child: child, scale: animation);
                              },
                              duration: const Duration(milliseconds: 200),
                              child: DaySchedule(
                                lessons: schedule.schedule[_pickedDay],
                                key: ValueKey<String>(_pickedDay),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    child: DaySwitcher(
                      changeDay: _changeDay,
                      day: _pickedDay,
                    ),
                  ),
                );
              }
            }
          }),
    );
  }
}

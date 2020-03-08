import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'add_schedule_day_screen.dart';
import '../models/days.dart';
import '../widgets/day_schedule.dart';
import '../providers/schedule_provider.dart';
import '../widgets/day_switcher.dart';
import '../widgets/app_drawer.dart';

class ScheduleScreen extends StatefulWidget {
  static const String routeName = '/';
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  static final String today = DateFormat.EEEE().format(DateTime.now());
  String _pickedDay = Day.containsKey(today) ? today : 'Monday';
  bool isLoading = true;
  double startPosition;
  double updatePosition;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    Provider.of<ScheduleProvider>(context, listen: false).fetchSchedule();
  }

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

  Future<void> _editDay() async {
    String response = await showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Wybierz akcje:',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    ...[
                      {'name': 'add', 'icon': Icons.add},
                      {'name': 'edit', 'icon': Icons.edit},
                      {'name': 'delete', 'icon': Icons.delete},
                    ].map(
                      (data) => Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        child: ListTile(
                          leading: Icon(
                            data['icon'],
                            color: Colors.red,
                          ),
                          title: Text(data['name']),
                          onTap: () => Navigator.of(context).pop(data['name']),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
    if (response != null) {
      switch (response) {
        case 'add':
          Navigator.of(context).pushNamed(AddScheduleDayScreen.routeName);
          break;
        case 'edit':
          Navigator.of(context)
              .pushNamed(AddScheduleDayScreen.routeName, arguments: _pickedDay);
          break;
        case 'delete':
          Provider.of<ScheduleProvider>(context, listen: false)
              .removeDay(_pickedDay);
          break;
        default:
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.edit),
          onPressed: _editDay,
        ),
        appBar: AppBar(
          title: const Text('Plan Lekcji'),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragStart: (DragStartDetails details) {
            startPosition = details.globalPosition.dx;
          },
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            updatePosition = details.globalPosition.dx;
          },
          onHorizontalDragEnd: (DragEndDetails details) {
            double distance = updatePosition - startPosition;
            if (distance > 80) {
              _changeDay('back');
            } else if (distance < -80) {
              _changeDay('forward');
            }
            updatePosition = 0.0;
            startPosition = 0.0;
          },
          child: Consumer<ScheduleProvider>(
            builder: (ctx, scheduleProvider, childSchedule) => Column(
              children: [
                childSchedule,
                Expanded(
                  child: SingleChildScrollView(
                    child: AnimatedSwitcher(
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(child: child, scale: animation);
                      },
                      duration: const Duration(milliseconds: 200),
                      child: DaySchedule(
                        lessons: scheduleProvider.schedule[_pickedDay],
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
        ));
  }
}

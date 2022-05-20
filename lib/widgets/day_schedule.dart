import 'package:flutter/material.dart';

import '../models/subject.dart';

class DaySchedule extends StatelessWidget {
  final List<Subject>? lessons;

  DaySchedule({this.lessons, Key? key}) : super(key: key);

  List<Widget> _timeLineBuilder(List<Subject> lessons) {
    int startTable = lessons[0].startTime.hour;
    int endTable = lessons[lessons.length - 1].endTime.hour + 1;
    List<Widget> list = [];
    for (var i = startTable; i < endTable; i++) {
      list.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 2,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              width: double.infinity,
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Container(
                        height: double.infinity, child: Text('$i:00')),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ),
                      height: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    list.add(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 2,
              color: Colors.grey.shade300,
            ),
          ),
        ),
        width: double.infinity,
        height: 40,
        child: Text('$endTable:00'),
      ),
    );
    return list;
  }

  String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }

  String convertToHoursFormat(TimeOfDay time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }

  List<Widget> _scheduleBuilder(
      List<Subject> lessons, BoxConstraints constraints) {
    List<Widget> list = [];
    double startTable = lessons[0].startTime.hour + 0.0;
    double endTable = lessons[lessons.length - 1].endTime.hour + 1.5;
    for (Subject item in lessons) {
      double tableRatio = constraints.biggest.height / (endTable - startTable);
      double startTime = toDouble(item.startTime) - startTable;
      double endTime =
          startTime + toDouble(item.endTime) - (startTime + startTable);
      list.add(
        Padding(
          padding: EdgeInsets.only(
            left: 50.0,
            right: 5.0,
            top: tableRatio * startTime + 3,
            bottom: constraints.biggest.height -
                ((startTime + (endTime - startTime)) * tableRatio),
          ),
          child: Container(
            padding: const EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: item.subcjectType == 'Ćwiczenia'
                  ? Colors.red.withOpacity(0.7)
                  : Colors.blue.withOpacity(0.7),
            ),
            width: double.infinity,
            height: (endTime - startTime) * tableRatio,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        item.subcject!,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text('czas: ${removeDecimalZeroFormat(item.duration!)}h'),
                  ],
                ),
                Text(
                  '${item.subcjectType}: ${convertToHoursFormat(item.startTime)} - ${convertToHoursFormat(item.endTime)}',
                ),
                if (item.lectureHall != '') Text('sala: ${item.lectureHall}'),
                if (item.professor != '')
                  Text('Wykładowca: ${item.professor} '),
              ],
            ),
          ),
        ),
      );
    }
    return list;
  }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: lessons!.length <= 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Na dziś nie ma lekcji',
                  style: TextStyle(fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Image.asset('assets/images/cool_smiley.png'),
                ),
              ],
            )
          : Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _timeLineBuilder(lessons!),
                ),
                Positioned.fill(
                  child: LayoutBuilder(
                    builder: (context, constraints) => Container(
                      child: Stack(
                        children: _scheduleBuilder(lessons!, constraints),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

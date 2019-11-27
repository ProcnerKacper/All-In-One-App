import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/schedule.dart';
import 'screens/add_schedule_day_screen.dart';
import 'screens/schedule_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Schedule(),
        ),
      ],
      child: MaterialApp(
        title: 'All in One',
        theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Colors.black,
            fontFamily: 'Dosis'),
        home: ScheduleScreen(),
        routes: {
          AddScheduleDayScreen.routeName: (ctx) => AddScheduleDayScreen(),
        },
      ),
    );
  }
}

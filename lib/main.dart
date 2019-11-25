import 'package:flutter/material.dart';

import 'screens/schedule_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All in One',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.black,
      ),
      home: ScheduleScreen(),
    );
  }
}

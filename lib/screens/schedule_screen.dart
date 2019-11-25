import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import 'add_schedule_day_screen.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
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
      body: Center(child: Text('Plan Lekcji')),
    );
  }
}

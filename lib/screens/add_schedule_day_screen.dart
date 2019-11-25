import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/days.dart';
import '../models/subject.dart';
import '../providers/schedule.dart';

class AddScheduleDayScreen extends StatefulWidget {
  static const routeName = '/add-schedule-day';
  @override
  _AddScheduleDayScreenState createState() => _AddScheduleDayScreenState();
}

class _AddScheduleDayScreenState extends State<AddScheduleDayScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj dzień'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: const Text('Dodaj dzień'),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

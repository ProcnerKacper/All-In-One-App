import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/days.dart';
import '../models/subject.dart';
import '../providers/schedule.dart';
import '../widgets/add_subject.dart';

class AddScheduleDayScreen extends StatefulWidget {
  static const routeName = '/add-schedule-day';
  @override
  _AddScheduleDayScreenState createState() => _AddScheduleDayScreenState();
}

class _AddScheduleDayScreenState extends State<AddScheduleDayScreen> {
  final _formKey = GlobalKey<FormState>();
  String _pickedDay;
  Map<String, dynamic> _formData = {};
  List<AddSubject> _listOfTextForm = [];

  @override
  void initState() {
    Subject sub = Subject();
    _listOfTextForm.add(
      AddSubject(
        subject: sub,
        index: 0,
        key: UniqueKey(),
      ),
    );
    super.initState();
  }

  void _addSubject() {
    int index = _listOfTextForm.length;
    Subject sub = Subject();
    setState(() {
      _listOfTextForm.add(AddSubject(
        subject: sub,
        index: index,
        remove: _removeSubject,
        key: UniqueKey(),
      ));
    });
  }

  void _removeSubject(int index) {
    setState(() {
      _listOfTextForm.removeWhere((i) => i.index == index);
    });
  }

  void _onSave() {
    bool allValid = true;
    _listOfTextForm.forEach((form) => allValid = form.isValid());
    if (!_formKey.currentState.validate()) allValid = false;
    if (allValid) {
      _formKey.currentState.save();
      List<Subject> subjects = _listOfTextForm.map((it) => it.subject).toList();
      Provider.of<Schedule>(context).addDay(subjects, _pickedDay);
      Navigator.of(context).pop();
    }
  }

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
                DropdownButtonFormField(
                  hint: const Text('Wybierz dzień'),
                  value: _pickedDay,
                  items: Day.keys
                      .map((day) => DropdownMenuItem(
                            value: day,
                            child: Text(
                              Day[day],
                            ),
                          ))
                      .toList(),
                  onChanged: (day) {
                    if (day != null) {
                      setState(() => _pickedDay = day);
                    }
                  },
                  validator: (String val) =>
                      val == null ? 'Nie wybrano dnia!' : null,
                  onSaved: (value) => setState(() => _formData['day'] = value),
                ),
                SizedBox(
                  height: 10,
                ),
                ..._listOfTextForm,
                FlatButton.icon(
                  textColor: Theme.of(context).primaryColor,
                  icon: const Icon(Icons.add),
                  label: const Text('Dodaj Lekcje'),
                  onPressed: _addSubject,
                ),
                RaisedButton(
                  onPressed: _onSave,
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

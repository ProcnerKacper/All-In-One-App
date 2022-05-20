import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/subject.dart';

class AddSubject extends StatefulWidget {
  final int? index;
  final Subject? subject;
  final state = _AddSubjectState();
  final Function? remove;

  AddSubject({this.index, this.subject, this.remove, Key? key})
      : super(key: key);

  @override
  _AddSubjectState createState() => state;

  bool isValid() => state.validate();
}

class _AddSubjectState extends State<AddSubject> {
  final _formKey = GlobalKey<FormState>();
  final _typeList = ['Wykład', 'Ćwiczenia'];
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;
  String? _type;
  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        _startTime = widget.subject!.startTime;
        _endTime = widget.subject!.endTime;
        _type = widget.subject!.subcjectType;
      });
      isInit = false;
    }
    super.didChangeDependencies();
  }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  Future<TimeOfDay?> _showTimePicker() async {
    return await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: DropdownButtonFormField(
                    hint: const Text('Wybierz typ zajęć'),
                    value: _type,
                    items: _typeList
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(
                                type,
                              ),
                            ))
                        .toList(),
                    onChanged: (dynamic type) {
                      if (type != null) {
                        setState(() => _type = type);
                      }
                    },
                    validator: (String? val) =>
                        val == null ? 'Nie wybrano typu zajęć!' : null,
                    onSaved: (dynamic val) {
                      widget.subject!.subcjectType = val;
                    },
                  ),
                ),
                if (widget.index! > 0)
                  IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () => widget.remove!(widget.index),
                  ),
              ],
            ),
            TextFormField(
                decoration: const InputDecoration(labelText: 'Lekcja'),
                initialValue: widget.subject!.subcject,
                validator: (String? val) =>
                    val == '' ? 'Nie podano nazyw przedmiotu!' : null,
                onSaved: (val) {
                  widget.subject!.subcject = val;
                }),
            TextFormField(
                decoration: const InputDecoration(labelText: 'Wykladowca'),
                initialValue: widget.subject!.professor,
                onSaved: (val) {
                  widget.subject!.professor = val;
                }),
            TextFormField(
                decoration: const InputDecoration(labelText: 'Sala'),
                initialValue: widget.subject!.lectureHall,
                onSaved: (val) {
                  widget.subject!.lectureHall = val;
                }),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton.icon(
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  icon: const Icon(Icons.alarm_on),
                  label: Text(
                    DateFormat('HH:mm').format(DateTime(
                        1969, 1, 1, _startTime.hour, _startTime.minute)),
                  ),
                  onPressed: () async {
                    TimeOfDay? time = await _showTimePicker();
                    if (time != null) {
                      if (toDouble(time) > toDouble(_endTime)) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: const Text(
                              'Czas zakończenia mniejszy od rozpoczęcia'),
                        ));
                      } else {
                        widget.subject!.startTime = time;
                        setState(() => _startTime = time);
                      }
                    }
                  },
                ),
                RaisedButton.icon(
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  icon: const Icon(Icons.alarm_off),
                  label: Text(
                    DateFormat('HH:mm').format(
                        DateTime(1969, 1, 1, _endTime.hour, _endTime.minute)),
                  ),
                  onPressed: () async {
                    TimeOfDay? time = await _showTimePicker();
                    if (time != null) {
                      if (toDouble(_startTime) > toDouble(time)) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content:
                              Text('Czas zakończenia mniejszy od rozpoczęcia'),
                        ));
                      } else {
                        widget.subject!.endTime = time;
                        setState(() => _endTime = time);
                      }
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool validate() {
    var valid = _formKey.currentState!.validate();
    if (valid) _formKey.currentState!.save();
    return valid;
  }
}

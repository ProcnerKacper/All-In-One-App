import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/injectable/injection.dart';
import '../../../data/models/subject.dart';
import '../../../widgets/base_widgets/app_text_form_field.dart';
import '../../../widgets/base_widgets/primary_icon_button.dart';
import '../../../widgets/view_model_provider.dart';
import '../view_models/add_schedule_day_view_model.dart';
import '../view_models/add_subject_view_model.dart';

class AddSubject extends StatelessWidget {
  const AddSubject({required this.subject, Key? key}) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) => ViewModelProvider<AddSubjectViewModel>(
        create: (_) => getIt<AddSubjectViewModel>()
          ..init(
            sub: subject,
            addScheduleDayViewModel: context.read<AddScheduleDayViewModel>(),
          ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Consumer<AddSubjectViewModel>(
            builder: (context, model, _) => Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        hint: const Text('Wybierz typ zajęć'),
                        value: model.type,
                        items: model.typeList
                            .map((type) => DropdownMenuItem(
                                  value: type,
                                  child: Text(
                                    type,
                                  ),
                                ))
                            .toList(),
                        onChanged: model.onTypeChange,
                        validator: model.validateSubjectType,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () => context
                          .read<AddScheduleDayViewModel>()
                          .removeSubject(model.subject),
                    ),
                  ],
                ),
                AppTextFormField(
                  label: 'Lekcja',
                  initialValue: model.subjectName,
                  validator: model.validateSubjectName,
                  onChanged: model.changeSubjectName,
                ),
                AppTextFormField(
                  label: 'Wykładowca',
                  initialValue: model.professor,
                  onChanged: model.changeProfessor,
                ),
                AppTextFormField(
                  label: 'Sala',
                  initialValue: model.lectureHall,
                  onChanged: model.changeLectureHall,
                  padding: const EdgeInsets.only(bottom: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    PrimaryIconButton(
                      icon: Icons.alarm_on,
                      label: DateFormat('HH:mm').format(
                        DateTime(
                          1969,
                          1,
                          1,
                          model.startTime.hour,
                          model.startTime.minute,
                        ),
                      ),
                      onPressed: () async {
                        _showTimePicker(context).then((time) {
                          if (time != null) {
                            if (model.toDouble(time) >
                                model.toDouble(model.endTime)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Czas zakończenia mniejszy od rozpoczęcia'),
                                ),
                              );
                            } else {
                              model.changeStartTime(time);
                            }
                          }
                        });
                      },
                    ),
                    PrimaryIconButton(
                      icon: Icons.alarm_off,
                      label: DateFormat('HH:mm').format(
                        DateTime(1969, 1, 1, model.endTime.hour,
                            model.endTime.minute),
                      ),
                      onPressed: () {
                        _showTimePicker(context).then((time) {
                          if (time != null) {
                            if (model.toDouble(model.startTime) >
                                model.toDouble(time)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Czas zakończenia mniejszy od rozpoczęcia'),
                                ),
                              );
                            } else {
                              model.changeEndTime(time);
                            }
                          }
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  Future<TimeOfDay?> _showTimePicker(BuildContext context) async {
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
}

// class AddSubject extends StatefulWidget {
//   final int? index;
//   final Subject? subject;
//   final state = _AddSubjectState();
//   final Function? remove;

//   AddSubject({this.index, this.subject, this.remove, Key? key})
//       : super(key: key);

//   @override
//   _AddSubjectState createState() => state;

//   bool isValid() => state.validate();
// }

// class _AddSubjectState extends State<AddSubject> {
//   final _formKey = GlobalKey<FormState>();
//   final _typeList = ['Wykład', 'Ćwiczenia'];
//   late TimeOfDay _startTime;
//   late TimeOfDay _endTime;
//   String? _type;
//   bool isInit = true;

//   @override
//   void didChangeDependencies() {
//     if (isInit) {
//       setState(() {
//         _startTime = widget.subject!.startTime;
//         _endTime = widget.subject!.endTime;
//         _type = widget.subject!.subjectType;
//       });
//       isInit = false;
//     }
//     super.didChangeDependencies();
//   }

//   



//   @override
//   Widget build(BuildContext context) {
//     return;
//   }

//   bool validate() {
//     var valid = _formKey.currentState!.validate();
//     if (valid) _formKey.currentState!.save();
//     return valid;
//   }
// }

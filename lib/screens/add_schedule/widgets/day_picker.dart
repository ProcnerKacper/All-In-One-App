import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/days.dart';
import '../view_models/add_schedule_day_view_model.dart';

class DayPicker extends StatelessWidget {
  const DayPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<AddScheduleDayViewModel>();
    return DropdownButtonFormField<String>(
      hint: const Text('Wybierz dzień'),
      value: model.pickedDay,
      items: Days.daysMap.entries
          .map(
            (day) => DropdownMenuItem(
              value: day.key,
              child: Text(day.value),
            ),
          )
          .toList(),
      onChanged: model.changePickedDay,
      validator: model.validatePickedDay,
    );
  }
}

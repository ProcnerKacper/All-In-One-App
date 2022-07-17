import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/days.dart';
import '../view_models/schedule_view_model.dart';

class DaySwitcher extends StatelessWidget {
  const DaySwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () =>
                context.read<ScheduleViewModel>().changeDay(Direction.backward),
            color: Colors.red,
          ),
          SizedBox(
            width: 160.0,
            child: Text(
              Days.getDay(context.watch<ScheduleViewModel>().pickedDay) ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            color: Colors.red,
            onPressed: () =>
                context.read<ScheduleViewModel>().changeDay(Direction.forward),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../view_models/schedule_view_model.dart';

class ChoiceAction {
  final DayAction action;
  final IconData icon;
  const ChoiceAction({required this.action, required this.icon});
}

class EditScheduleDialog extends StatelessWidget {
  const EditScheduleDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Wybierz akcje:',
              style: TextStyle(fontSize: 30.0),
            ),
            const SizedBox(
              height: 25.0,
            ),
            ...[
              const ChoiceAction(action: DayAction.create, icon: Icons.add),
              const ChoiceAction(action: DayAction.edit, icon: Icons.edit),
              const ChoiceAction(action: DayAction.delete, icon: Icons.delete),
            ].map(
              (data) => Card(
                elevation: 4,
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: ListTile(
                  leading: Icon(
                    data.icon,
                    color: Colors.red,
                  ),
                  title: Text(data.action.name),
                  onTap: () => AutoRouter.of(context).pop(data.action),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

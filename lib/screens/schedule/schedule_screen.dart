import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/injectable/injection.dart';
import '../../widgets/base_widgets/base_screen.dart';
import '../../widgets/view_model_provider.dart';
import 'widgets/day_schedule.dart';
import 'widgets/day_switcher.dart';
import 'view_models/schedule_view_model.dart';
import 'widgets/edit_schedule_dialog.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = getIt<ScheduleViewModel>();
    return ViewModelProvider<ScheduleViewModel>(
      create: (_) => model..init(),
      child: BaseScreen(
        enableScroll: false,
        floatingAction: () async {
          final response = await showDialog<DayAction?>(
            context: context,
            builder: (_) => const EditScheduleDialog(),
          );
          model.editDay(response);
        },
        floatingIcon: Icons.edit,
        title: 'Plan Lekcji',
        child: Consumer<ScheduleViewModel>(
          builder: (context, model, _) => model.loading
              ? const Center(child: CircularProgressIndicator())
              : GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onHorizontalDragStart: model.onHorizontalDragStart,
                  onHorizontalDragUpdate: model.onHorizontalDragUpdate,
                  onHorizontalDragEnd: model.onHorizontalDragEnd,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const DaySwitcher(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: AnimatedSwitcher(
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                            duration: const Duration(milliseconds: 200),
                            child: DaySchedule(
                              lessons:
                                  model.schedule[model.pickedDay]?.subjects,
                              key: ValueKey<String>(model.pickedDay),
                            ),
                          ),
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

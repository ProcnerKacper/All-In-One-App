import 'package:allinone/screens/add_schedule/widgets/add_subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../core/injectable/injection.dart';
import '../../data/models/days.dart';
import '../../widgets/base_widgets/base_screen.dart';
import '../../widgets/base_widgets/primary_button.dart';
import '../../widgets/view_model_provider.dart';
import 'view_models/add_schedule_day_view_model.dart';
import 'widgets/day_picker.dart';

class AddScheduleDayScreen extends HookWidget {
  const AddScheduleDayScreen({this.dayName, Key? key}) : super(key: key);
  final String? dayName;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final viewModel = getIt<AddScheduleDayViewModel>();
    return ViewModelProvider<AddScheduleDayViewModel>(
      create: (_) => viewModel..init(key: dayName),
      child: BaseScreen(
        enableDrawer: false,
        title: viewModel.isCreateMode ? 'Dodaj dzień' : 'Edytuj Dzień',
        child: Form(
          key: formKey,
          child: Consumer<AddScheduleDayViewModel>(
            builder: (context, model, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !model.isCreateMode
                    ? Text(Days.getDay(model.pickedDay!) ?? '')
                    : const DayPicker(),
                const SizedBox(
                  height: 10,
                ),
                ...model.listOfTextForm
                    .map((e) => AddSubject(subject: e))
                    .toList(),
                TextButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Dodaj Lekcje'),
                  onPressed: model.addSubject,
                ),
                PrimaryButton(
                  onPressed: () => model.onSave(formKey),
                  label:
                      model.isCreateMode ? 'Dodaj dzień' : 'Zaktualizuj dzień',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class _AddScheduleDayScreenState extends State<AddScheduleDayScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String? _pickedDay;
//   Map<String, dynamic> _formData = {};
//   List<AddSubject> _listOfTextForm = [];

//   void _removeSubject(int index) {
//     setState(() {
//       _listOfTextForm.removeWhere((i) => i.index == index);
//     });
//   }


//   void _onSave() {
//     bool allValid = true;
//     _listOfTextForm.forEach((form) => allValid = form.isValid());
//     if (!_formKey.currentState!.validate()) allValid = false;
//     if (allValid) {
//       _formKey.currentState!.save();
//       final subjects = _listOfTextForm.map((it) => it.subject).toList();
//       Provider.of<ScheduleProvider>(context).addDay(subjects, _formData['day']);
//       Navigator.of(context).pop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dodaj dzień'),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: 
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../core/injectable/injection.dart';
import '../../widgets/base_widgets/app_text_form_field.dart';
import '../../widgets/base_widgets/base_screen.dart';
import '../../widgets/base_widgets/primary_button.dart';
import '../../widgets/view_model_provider.dart';
import 'view_models/add_list_item_view_model.dart';

class AddListItem extends HookWidget {
  const AddListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    return BaseScreen(
      enableDrawer: false,
      title: 'Dodaj nowy produkt',
      child: ViewModelProvider<AddListItemViewModel>(
        create: (_) => getIt<AddListItemViewModel>()..init(),
        child: Form(
          key: formKey,
          child: Consumer<AddListItemViewModel>(
            builder: (context, model, __) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppTextFormField(
                    label: 'Nazwa produktu',
                    validator: model.validateName,
                    onChanged: (value) =>
                        model.update(model.shopItem.copyWith(name: value)),
                  ),
                  AppTextFormField(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    keyboardType: TextInputType.number,
                    label: 'Ilość',
                    validator: model.validateAmount,
                    onChanged: (value) => model.update(
                        model.shopItem.copyWith(amount: int.tryParse(value))),
                  ),
                  PrimaryButton(
                    onPressed: () => model.save(formKey),
                    label: 'Dodaj produkt',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

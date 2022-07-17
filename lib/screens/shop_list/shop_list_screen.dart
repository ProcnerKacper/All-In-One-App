import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/router/router.dart';
import '../../widgets/base_widgets/base_screen.dart';
import 'widget/shop_item.dart';
import '../../widgets/view_model_provider.dart';
import 'view_model/shop_list_view_model.dart';

class ShopListScreen extends StatelessWidget {
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ShopListViewModel>(
      create: (_) => ShopListViewModel()..init(),
      child: BaseScreen(
        title: 'Lista Zakupów',
        floatingIcon: Icons.add,
        enableScroll: false,
        floatingAction: () =>
            AutoRouter.of(context).navigate(const AddListItemRoute()),
        child: Consumer<ShopListViewModel>(builder: (context, model, _) {
          if (model.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemBuilder: (context, i) => Dismissible(
              key: ValueKey(model.list[i].id),
              background: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (_) => model.removeItem(model.list[i]),
              child: ShopItem(item: model.list[i]),
            ),
            itemCount: model.list.length,
          );
        }),
      ),
    );
  }
}

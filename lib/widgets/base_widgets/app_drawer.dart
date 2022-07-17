import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/router/router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Menu'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Plan Lekcji'),
            onTap: () =>
                AutoRouter.of(context).replace(const ScheduleScreenRoute()),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('List zakupów'),
            onTap: () =>
                AutoRouter.of(context).replace(const ShopListScreenRoute()),
          ),
        ],
      ),
    );
  }
}

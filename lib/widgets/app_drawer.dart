import 'package:flutter/material.dart';

import '../screens/shop_list_screen.dart';

class AppDrawer extends StatelessWidget {
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
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('List zakupów'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ShopListScreen.routeName),
          ),
        ],
      ),
    );
  }
}

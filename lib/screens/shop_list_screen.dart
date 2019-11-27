import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import 'add_list_item.dart';

class ShopListScreen extends StatelessWidget {
  static const routeName = '/shop-list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Lista Zakupów'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed(AddListItem.routeName),
      ),
      body: Center(child: Text('Lista Zakupów')),
    );
  }
}

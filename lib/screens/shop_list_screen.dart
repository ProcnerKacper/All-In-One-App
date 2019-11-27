import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';

class ShopListScreen extends StatelessWidget {
  static const routeName = '/shop-list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Lista Zakupów'),
      ),
      body: Center(child: Text('Lista Zakupów')),
    );
  }
}

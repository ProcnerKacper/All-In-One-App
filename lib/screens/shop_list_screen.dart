import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/shop_list_provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/shop_item.dart';
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
      body: FutureBuilder(
          future:
              Provider.of<ShopListProvider>(context, listen: false).fetchList(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                return Center(
                  child: Text('An error occurred!'),
                );
              } else {
                return Consumer<ShopListProvider>(
                  builder: (_, list, __) => ListView.builder(
                    itemBuilder: (_, i) => Dismissible(
                      key: ValueKey(list.list[i].id),
                      background: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.centerRight,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        color: Colors.red,
                      ),
                      child: ShopItem(list.list[i]),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) {
                        Provider.of<ShopListProvider>(context, listen: false)
                            .deleteItem(list.list[i].id);
                      },
                    ),
                    itemCount: list.list.length,
                  ),
                );
              }
            }
          }),
    );
  }
}

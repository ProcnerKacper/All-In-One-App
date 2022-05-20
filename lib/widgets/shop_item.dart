import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../providers/shop_list_provider.dart';
import 'rounded_checkbox.dart';

class ShopItem extends StatelessWidget {
  final Item item;

  ShopItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        image: item.inCart!
            ? DecorationImage(
                image: AssetImage('assets/images/brush.png'),
                fit: BoxFit.fitWidth)
            : null,
      ),
      child: ListTile(
        title: Text(
          item.name!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: RoundedCheckbox(
          value: item.inCart,
          onChange: (val) {
            Provider.of<ShopListProvider>(context).change(item.id!, val);
          },
          size: 18.0,
          color: Colors.red,
        ),
        trailing: Text(
          item.amount.toString(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

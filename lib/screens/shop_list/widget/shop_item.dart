import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../data/models/item.dart';
import '../../../../../widgets/rounded_checkbox.dart';
import '../view_model/shop_list_view_model.dart';

class ShopItem extends StatelessWidget {
  final Item item;

  const ShopItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('wrapperContainer'),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        image: item.inCart
            ? const DecorationImage(
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
          onChange: (val) => context.read<ShopListViewModel>().change(item.id!),
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

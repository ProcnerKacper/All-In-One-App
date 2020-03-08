import 'package:flutter/material.dart';

import '../helpers/DBHelper.dart';
import '../models/item.dart';

class ShopListProvider with ChangeNotifier {
  List<Item> _list = [];

  List<Item> get list {
    return [..._list];
  }

  Future<List<Item>> fetchList() async {
    List<Item> list = await DBHelper.getShopList();
    _list = list;
    notifyListeners();
    return list;
  }

  Future<void> addItem(name, amount) async {
    try {
      await DBHelper.addShopItem(
          {'name': name, 'amount': amount, 'inCart': false});
      fetchList();
    } catch (e) {}
  }

  Future<void> deleteItem(id) async {
    await DBHelper.removeShopItem(id);
    fetchList();
  }

  Future<void> change(String id, bool value) async {
    final prodIndex = _list.indexWhere((prod) => prod.id == id);
    await DBHelper.updateShopItem(
      {
        "amount": _list[prodIndex].amount,
        "name": _list[prodIndex].name,
        "inCart": value,
      },
      id,
    );
    fetchList();
  }
}

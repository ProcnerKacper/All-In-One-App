import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/item.dart';

class ShopList with ChangeNotifier {
  List<Item> _list = [];

  List<Item> get list {
    return [..._list];
  }

  Future<List<Item>> fetchList() async {
    final res =
        await http.get('https://flutter-246b3.firebaseio.com/shopList.json');
    final resData = json.decode(res.body) as Map<String, dynamic>;
    List<Item> list = [];
    if (resData != null) {
      resData.forEach((key, item) {
        list.add(Item(
            id: key,
            name: item['name'],
            amount: int.parse(item['amount']),
            inCart: item['inCart']));
      });
    }
    _list = list;
    notifyListeners();
    return list;
  }

  Future<void> addItem(name, amount) async {
    final body = {'name': name, 'amount': amount, 'inCart': false};
    final res = await http.post(
      'https://flutter-246b3.firebaseio.com/shopList.json',
      body: json.encode(body),
    );
    final newProduct = Item(
        name: name,
        amount: int.parse(amount),
        inCart: false,
        id: json.decode(res.body)['name']);
    _list.insert(0, newProduct);
    notifyListeners();
  }

  Future<void> deleteItem(id) async {
    final prodIndex = _list.indexWhere((prod) => prod.id == id);
    final oldProduct = _list[prodIndex];
    _list.remove(prodIndex);
    try {
      final res = await http.delete(
        'https://flutter-246b3.firebaseio.com/shopList/$id.json',
      );
    } catch (e) {
      _list.add(oldProduct);
      notifyListeners();
    }
  }

  Future<void> change(String id, bool value) async {
    final prodIndex = _list.indexWhere((prod) => prod.id == id);
    final oldProduct = _list[prodIndex];
    _list[prodIndex] = Item(
      id: id,
      amount: _list[prodIndex].amount,
      name: _list[prodIndex].name,
      inCart: value,
    );
    notifyListeners();
    try {
      final res = await http.patch(
        'https://flutter-246b3.firebaseio.com/shopList/$id.json',
        body: json.encode({'inCart': value}),
      );
      if (res.statusCode >= 400) {
        throw HttpException('network error');
      }
    } catch (e) {
      _list[prodIndex] = oldProduct;
      notifyListeners();
    }
  }
}

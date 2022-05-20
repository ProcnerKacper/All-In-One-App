import 'package:flutter/foundation.dart';

class Item {
  String? id;
  String? name;
  int? amount;
  bool? inCart;

  Item({
    required this.name,
    required this.amount,
    this.inCart = false,
    this.id,
  });
}

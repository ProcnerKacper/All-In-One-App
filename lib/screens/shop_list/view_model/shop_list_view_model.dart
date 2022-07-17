import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

import '../../../core/injectable/injection.dart';
import '../../../data/models/item.dart';
import '../../../data/repositories/shop_list_repository.dart';

@injectable
class ShopListViewModel extends ChangeNotifier {
  final ShopListRepository _shopListRepository = getIt<ShopListRepository>();

  bool _loading = true;
  List<Item> _shopList = [];

  bool get isLoading => _loading;

  List<Item> get list => _shopList;

  Future<void> init() async {
    _loading = true;
    notifyListeners();
    _shopList = await _shopListRepository.getShopList();
    _loading = false;
    notifyListeners();
  }

  Future<void> change(String id) async {
    final item = _shopList.firstWhereOrNull((element) => element.id == id);
    if (item == null) return;
    await _shopListRepository.changeItem(item.copyWith(inCart: !item.inCart));
    _shopList = await _shopListRepository.getShopList();
    notifyListeners();
  }

  Future<void> removeItem(Item item) async {
    final index = _shopList.indexWhere((element) => element.id == item.id);
    _shopList.removeAt(index);
    notifyListeners();
    await _shopListRepository.removeItem(item);
    _shopList = await _shopListRepository.getShopList();
    notifyListeners();
  }
}

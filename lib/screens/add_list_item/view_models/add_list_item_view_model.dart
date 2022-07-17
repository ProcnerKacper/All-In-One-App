import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../core/injectable/injection.dart';
import '../../../core/router/router.dart';
import '../../../data/models/item.dart';
import '../../../data/repositories/shop_list_repository.dart';
import '../../shop_list/view_model/shop_list_view_model.dart';

@injectable
class AddListItemViewModel extends ChangeNotifier {
  final navigator = getIt<AppRouter>();
  final ShopListRepository _shopListRepository = getIt<ShopListRepository>();
  final ShopListViewModel _shopListViewModel = getIt<ShopListViewModel>();
  late Item _item;

  Item get shopItem => _item;

  void init({Item? item}) async {
    _item = item ?? const Item();
    notifyListeners();
  }

  void save(GlobalKey<FormState> key) async {
    if (key.currentState?.validate() ?? false) {
      await _shopListRepository.saveShopItem(_item);
      _shopListViewModel.init();
      navigator.pop();
    }
  }

  void update(Item item) {
    _item = item;
    notifyListeners();
  }

  String? validateName(String? value) {
    return value?.isNotEmpty ?? false ? null : 'Nie podano nazwy produktu!';
  }

  String? validateAmount(String? value) {
    return (double.tryParse(value!) ?? 0) > 0 ? null : 'Niepoprawna wartość!';
  }
}

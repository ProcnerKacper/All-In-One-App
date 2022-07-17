import 'package:injectable/injectable.dart';

import '../models/item.dart';
import '../sources/db_source.dart';
import 'shop_list_repository.dart';

@Injectable(as: ShopListRepository)
class ShopListRepositoryImpl implements ShopListRepository {
  final DBSource _dbSource;
  const ShopListRepositoryImpl(this._dbSource);

  @override
  Future<List<Item>> getShopList() {
    return _dbSource.getShopList();
  }

  @override
  Future<void> saveShopItem(Item item) async {
    await _dbSource.saveShopItem(item);
  }

  @override
  Future<void> changeItem(Item item) async {
    await _dbSource.changeShopItem(item);
  }

  @override
  Future<void> removeItem(Item item) async {
    await _dbSource.removeShopItem(item);
  }
}

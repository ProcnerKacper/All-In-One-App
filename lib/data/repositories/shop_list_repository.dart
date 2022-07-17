import '../models/item.dart';

abstract class ShopListRepository {
  Future<List<Item>> getShopList();

  Future<void> saveShopItem(Item item);

  Future<void> changeItem(Item item);

  Future<void> removeItem(Item item);
}

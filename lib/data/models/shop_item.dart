import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_item.freezed.dart';
part 'shop_item.g.dart';

@freezed
class ShopItem with _$ShopItem {
  const factory ShopItem({
    @Default('') String id,
    @Default('') String name,
    @Default(1) double amount,
    @Default(false) bool bought,
  }) = _ShopItem;

  factory ShopItem.fromJson(Map<String, dynamic> json) =>
      _$ShopItemFromJson(json);
}

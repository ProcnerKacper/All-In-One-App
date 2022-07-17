// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopItem _$$_ShopItemFromJson(Map<String, dynamic> json) => _$_ShopItem(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 1,
      bought: json['bought'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ShopItemToJson(_$_ShopItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'bought': instance.bought,
    };

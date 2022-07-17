// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopItem _$ShopItemFromJson(Map<String, dynamic> json) {
  return _ShopItem.fromJson(json);
}

/// @nodoc
mixin _$ShopItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  bool get bought => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopItemCopyWith<ShopItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopItemCopyWith<$Res> {
  factory $ShopItemCopyWith(ShopItem value, $Res Function(ShopItem) then) =
      _$ShopItemCopyWithImpl<$Res>;
  $Res call({String id, String name, double amount, bool bought});
}

/// @nodoc
class _$ShopItemCopyWithImpl<$Res> implements $ShopItemCopyWith<$Res> {
  _$ShopItemCopyWithImpl(this._value, this._then);

  final ShopItem _value;
  // ignore: unused_field
  final $Res Function(ShopItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? bought = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      bought: bought == freezed
          ? _value.bought
          : bought // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ShopItemCopyWith<$Res> implements $ShopItemCopyWith<$Res> {
  factory _$$_ShopItemCopyWith(
          _$_ShopItem value, $Res Function(_$_ShopItem) then) =
      __$$_ShopItemCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, double amount, bool bought});
}

/// @nodoc
class __$$_ShopItemCopyWithImpl<$Res> extends _$ShopItemCopyWithImpl<$Res>
    implements _$$_ShopItemCopyWith<$Res> {
  __$$_ShopItemCopyWithImpl(
      _$_ShopItem _value, $Res Function(_$_ShopItem) _then)
      : super(_value, (v) => _then(v as _$_ShopItem));

  @override
  _$_ShopItem get _value => super._value as _$_ShopItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? bought = freezed,
  }) {
    return _then(_$_ShopItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      bought: bought == freezed
          ? _value.bought
          : bought // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopItem implements _ShopItem {
  const _$_ShopItem(
      {this.id = '', this.name = '', this.amount = 1, this.bought = false});

  factory _$_ShopItem.fromJson(Map<String, dynamic> json) =>
      _$$_ShopItemFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final bool bought;

  @override
  String toString() {
    return 'ShopItem(id: $id, name: $name, amount: $amount, bought: $bought)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.bought, bought));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(bought));

  @JsonKey(ignore: true)
  @override
  _$$_ShopItemCopyWith<_$_ShopItem> get copyWith =>
      __$$_ShopItemCopyWithImpl<_$_ShopItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopItemToJson(this);
  }
}

abstract class _ShopItem implements ShopItem {
  const factory _ShopItem(
      {final String id,
      final String name,
      final double amount,
      final bool bought}) = _$_ShopItem;

  factory _ShopItem.fromJson(Map<String, dynamic> json) = _$_ShopItem.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  double get amount => throw _privateConstructorUsedError;
  @override
  bool get bought => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ShopItemCopyWith<_$_ShopItem> get copyWith =>
      throw _privateConstructorUsedError;
}

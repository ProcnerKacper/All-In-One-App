// Mocks generated by Mockito 5.2.0 from annotations
// in allinone/test/screens/shop_list/view_model/shop_list_view_model_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:allinone/data/models/item.dart' as _i4;
import 'package:allinone/data/repositories/shop_list_repository.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [ShopListRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockShopListRepository extends _i1.Mock
    implements _i2.ShopListRepository {
  MockShopListRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Item>> getShopList() =>
      (super.noSuchMethod(Invocation.method(#getShopList, []),
              returnValue: Future<List<_i4.Item>>.value(<_i4.Item>[]))
          as _i3.Future<List<_i4.Item>>);
  @override
  _i3.Future<void> saveShopItem(_i4.Item? item) =>
      (super.noSuchMethod(Invocation.method(#saveShopItem, [item]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> changeItem(_i4.Item? item) =>
      (super.noSuchMethod(Invocation.method(#changeItem, [item]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> removeItem(_i4.Item? item) =>
      (super.noSuchMethod(Invocation.method(#removeItem, [item]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
}

import 'package:allinone/data/models/item.dart';
import 'package:allinone/data/repositories/shop_list_repository.dart';
import 'package:allinone/screens/shop_list/view_model/shop_list_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'shop_list_view_model_test.mocks.dart';

@GenerateMocks([ShopListRepository])
void main() {
  group('ShopListViewModel', () {
    late ShopListRepository mockShopListRepository;
    late ShopListViewModel shopListViewModel;
    shopList({inCart = false}) => [Item(id: 'x123', inCart: inCart)];

    setUp(() {
      GetIt.instance.reset();
      mockShopListRepository = MockShopListRepository();
      GetIt.instance
          .registerFactory<ShopListRepository>(() => mockShopListRepository);
      shopListViewModel = ShopListViewModel();
    });
    group('change', () {
      final item = shopList().first;
      setUp(() async {
        when(mockShopListRepository.getShopList())
            .thenAnswer((_) async => shopList());
        await shopListViewModel.init();
      });

      test('change inCart item to true', () async {
        when(mockShopListRepository.getShopList())
            .thenAnswer((_) async => shopList(inCart: true));

        await shopListViewModel.change(item.id!);
        verify(mockShopListRepository.changeItem(item)).called(1);
        expect(shopListViewModel.list, shopList(inCart: true));
      });
      test('no change if item in list not found', () async {
        await shopListViewModel.change('asdsadad');
        verifyNever(mockShopListRepository.changeItem(item));
        expect(shopListViewModel.list, shopList());
      });
    });

    group('init', () {
      test('get shop list from repository', () async {
        when(mockShopListRepository.getShopList())
            .thenAnswer((_) async => shopList());

        expect(shopListViewModel.isLoading, true);
        expect(shopListViewModel.list, []);

        await shopListViewModel.init();

        expect(shopListViewModel.isLoading, false);
        expect(shopListViewModel.list, shopList());
      });
    });
  });
}

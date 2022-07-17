import 'package:allinone/data/models/item.dart';
import 'package:allinone/screens/shop_list/widget/shop_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ShopItem widget', () {
    Key wrapperKey = const ValueKey('wrapperContainer');
    Future<void> pumpWidget(WidgetTester tester, bool inCart) async {
      await tester.pumpWidget(
        Scaffold(
          body: ShopItem(
            item: Item(id: '123', name: 'Test', amount: 3, inCart: inCart),
          ),
        ),
      );
    }

    testWidgets(
      'ShopItem have inCart indicator,name and amount',
      (tester) async {
        await pumpWidget(tester, false);

        final nameFinder = find.text('Test');
        final amountFinder = find.text('3');

        expect(nameFinder, findsOneWidget);
        expect(amountFinder, findsOneWidget);
      },
    );
    testWidgets(
      'When Item have inCard set to false boxDecoration have no image',
      (tester) async {
        await pumpWidget(tester, false);

        Container containerFinder = tester.firstWidget(find.byKey(wrapperKey));

        expect((containerFinder.decoration as BoxDecoration).image, null);
      },
    );
    testWidgets(
      'When Item have inCard set to true boxDecoration have image',
      (tester) async {
        await pumpWidget(tester, true);

        Container containerFinder = tester.firstWidget(find.byKey(wrapperKey));

        expect(
          (containerFinder.decoration as BoxDecoration).image,
          isA<DecorationImage>(),
        );
      },
    );
  });
}

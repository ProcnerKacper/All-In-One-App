import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/schedule.dart';
import 'providers/shop_list.dart';
import 'screens/add_list_item.dart';
import 'screens/add_schedule_day_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/shop_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Schedule(),
        ),
        ChangeNotifierProvider.value(
          value: ShopList(),
        ),
      ],
      child: MaterialApp(
        title: 'All in One',
        theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Colors.black,
            fontFamily: 'Dosis'),
        home: ScheduleScreen(),
        routes: {
          AddScheduleDayScreen.routeName: (ctx) => AddScheduleDayScreen(),
          ShopListScreen.routeName: (ctx) => ShopListScreen(),
          AddListItem.routeName: (ctx) => AddListItem()
        },
      ),
    );
  }
}

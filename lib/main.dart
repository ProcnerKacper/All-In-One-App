import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'providers/schedule_provider.dart';
import 'providers/shop_list_provider.dart';
import 'screens/add_list_item.dart';
import 'screens/add_schedule_day_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/shop_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ScheduleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ShopListProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'All in One',
        theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Colors.black,
            fontFamily: 'Dosis'),
        initialRoute: ScheduleScreen.routeName,
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          late Widget widget;
          switch (settings.name) {
            case AddScheduleDayScreen.routeName:
              widget = AddScheduleDayScreen(args as String?);
              break;
            case ScheduleScreen.routeName:
              widget = ScheduleScreen();
              break;
            case AddListItem.routeName:
              widget = AddListItem();
              break;
            case ShopListScreen.routeName:
              widget = ShopListScreen();
              break;
          }
          return MaterialPageRoute(builder: (_) => widget);
        },
      ),
    );
  }
}

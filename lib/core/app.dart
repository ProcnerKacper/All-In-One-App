import 'package:flutter/material.dart';

import 'injectable/injection.dart';
import 'router/router.gr.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'All in One',
        theme: ThemeData(
          fontFamily: 'Dosis',
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Colors.red,
                secondary: Colors.black,
              ),
        ),
        routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
        routerDelegate: getIt<AppRouter>().delegate(),
      );
}

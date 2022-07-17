import 'package:injectable/injectable.dart';

import '../../router/router.dart';

@module
abstract class AppRouterModule {
  @singleton
  AppRouter get instance => AppRouter();
}

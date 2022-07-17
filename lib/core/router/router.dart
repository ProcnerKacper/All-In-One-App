import 'package:auto_route/auto_route.dart';

import '../../screens/add_list_item/add_list_item.dart';
import '../../screens/add_schedule/add_schedule_day_screen.dart';
import '../../screens/schedule/schedule_screen.dart';
import '../../screens/shop_list/shop_list_screen.dart';

export 'router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: ScheduleScreen, initial: true),
    MaterialRoute<String?>(page: AddScheduleDayScreen),
    MaterialRoute(page: AddListItem),
    MaterialRoute(page: ShopListScreen),
  ],
)
class $AppRouter {}

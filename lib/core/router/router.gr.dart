// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../screens/add_list_item/add_list_item.dart' as _i3;
import '../../screens/add_schedule/add_schedule_day_screen.dart' as _i2;
import '../../screens/schedule/schedule_screen.dart' as _i1;
import '../../screens/shop_list/shop_list_screen.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ScheduleScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ScheduleScreen());
    },
    AddScheduleDayScreenRoute.name: (routeData) {
      final args = routeData.argsAs<AddScheduleDayScreenRouteArgs>(
          orElse: () => const AddScheduleDayScreenRouteArgs());
      return _i5.MaterialPageX<String?>(
          routeData: routeData,
          child:
              _i2.AddScheduleDayScreen(dayName: args.dayName, key: args.key));
    },
    AddListItemRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.AddListItem());
    },
    ShopListScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ShopListScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(ScheduleScreenRoute.name, path: '/'),
        _i5.RouteConfig(AddScheduleDayScreenRoute.name,
            path: '/add-schedule-day-screen'),
        _i5.RouteConfig(AddListItemRoute.name, path: '/add-list-item'),
        _i5.RouteConfig(ShopListScreenRoute.name, path: '/shop-list-screen')
      ];
}

/// generated route for
/// [_i1.ScheduleScreen]
class ScheduleScreenRoute extends _i5.PageRouteInfo<void> {
  const ScheduleScreenRoute() : super(ScheduleScreenRoute.name, path: '/');

  static const String name = 'ScheduleScreenRoute';
}

/// generated route for
/// [_i2.AddScheduleDayScreen]
class AddScheduleDayScreenRoute
    extends _i5.PageRouteInfo<AddScheduleDayScreenRouteArgs> {
  AddScheduleDayScreenRoute({String? dayName, _i6.Key? key})
      : super(AddScheduleDayScreenRoute.name,
            path: '/add-schedule-day-screen',
            args: AddScheduleDayScreenRouteArgs(dayName: dayName, key: key));

  static const String name = 'AddScheduleDayScreenRoute';
}

class AddScheduleDayScreenRouteArgs {
  const AddScheduleDayScreenRouteArgs({this.dayName, this.key});

  final String? dayName;

  final _i6.Key? key;

  @override
  String toString() {
    return 'AddScheduleDayScreenRouteArgs{dayName: $dayName, key: $key}';
  }
}

/// generated route for
/// [_i3.AddListItem]
class AddListItemRoute extends _i5.PageRouteInfo<void> {
  const AddListItemRoute()
      : super(AddListItemRoute.name, path: '/add-list-item');

  static const String name = 'AddListItemRoute';
}

/// generated route for
/// [_i4.ShopListScreen]
class ShopListScreenRoute extends _i5.PageRouteInfo<void> {
  const ShopListScreenRoute()
      : super(ShopListScreenRoute.name, path: '/shop-list-screen');

  static const String name = 'ShopListScreenRoute';
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_database/firebase_database.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repositories/schedule_repository.dart' as _i10;
import '../../data/repositories/schedule_repository_impl.dart' as _i11;
import '../../data/repositories/shop_list_repository.dart' as _i13;
import '../../data/repositories/shop_list_repository_impl.dart' as _i14;
import '../../data/sources/db_source.dart' as _i7;
import '../../data/sources/firebase_db.dart' as _i8;
import '../../screens/add_list_item/view_models/add_list_item_view_model.dart'
    as _i3;
import '../../screens/add_schedule/view_models/add_schedule_day_view_model.dart'
    as _i4;
import '../../screens/add_schedule/view_models/add_subject_view_model.dart'
    as _i5;
import '../../screens/schedule/view_models/schedule_view_model.dart' as _i12;
import '../../screens/shop_list/view_model/shop_list_view_model.dart' as _i15;
import '../router/router.dart' as _i6;
import 'modules/app_router.dart' as _i16;
import 'modules/firebase_database.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appRouterModule = _$AppRouterModule();
  final firebaseDB = _$FirebaseDB();
  gh.factory<_i3.AddListItemViewModel>(() => _i3.AddListItemViewModel());
  gh.factory<_i4.AddScheduleDayViewModel>(() => _i4.AddScheduleDayViewModel());
  gh.factory<_i5.AddSubjectViewModel>(() => _i5.AddSubjectViewModel());
  gh.singleton<_i6.AppRouter>(appRouterModule.instance);
  gh.lazySingleton<_i7.DBSource>(() => _i8.FirebaseDB());
  gh.factory<_i9.FirebaseDatabase>(() => firebaseDB.instance);
  gh.factory<_i10.ScheduleRepository>(
      () => _i11.ScheduleRepositoryImpl(get<_i7.DBSource>()));
  gh.factory<_i12.ScheduleViewModel>(() => _i12.ScheduleViewModel());
  gh.factory<_i13.ShopListRepository>(
      () => _i14.ShopListRepositoryImpl(get<_i7.DBSource>()));
  gh.factory<_i15.ShopListViewModel>(() => _i15.ShopListViewModel());
  return get;
}

class _$AppRouterModule extends _i16.AppRouterModule {}

class _$FirebaseDB extends _i17.FirebaseDB {}

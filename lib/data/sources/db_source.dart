import '../models/item.dart';
import '../models/schedule_day.dart';

abstract class DBSource {
  Future<Map<String, ScheduleDay>> getSchedule();
  Future<List<Item>> getShopList();
  Future<void> removeDay(String day);
  Future<ScheduleDay> getDay(String day);

  Future<void> saveShopItem(Item item);

  Future<void> changeShopItem(Item item);

  Future<void> updateDay(ScheduleDay scheduleDay);

  Future<void> createDay(ScheduleDay scheduleDay);

  Future<void> removeShopItem(Item item);
}

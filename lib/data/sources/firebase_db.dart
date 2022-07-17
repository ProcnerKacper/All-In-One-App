import 'dart:convert';

import 'package:allinone/data/models/schedule_day.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

import '../models/days.dart';
import '../models/item.dart';
import '../models/subject.dart';
import 'db_source.dart';

@LazySingleton(as: DBSource)
class FirebaseDB implements DBSource {
  late DatabaseReference _db;

  FirebaseDB() {
    FirebaseDatabase instance = FirebaseDatabase.instance
      ..setPersistenceEnabled(true);
    _db = instance.ref()..keepSynced(true);
  }

  @override
  Future<Map<String, ScheduleDay>> getSchedule() async {
    final response = await _db.child('subjects').once();
    final subjectsResp = response.snapshot.value;
    Map<String, ScheduleDay> schedule =
        Map.fromIterable(Days.days, value: (day) => ScheduleDay(name: day));
    if (subjectsResp == null) return schedule;
    Map<String, dynamic> subjectsMap = jsonDecode(jsonEncode(subjectsResp));
    return subjectsMap.map(
      (key, value) => MapEntry(
        key,
        ScheduleDay.fromJson(value),
      ),
    );
  }

  @override
  Future<void> removeDay(String day) async {
    await _db.child('subjects').child(day).remove();
  }

  @override
  Future<ScheduleDay> getDay(String day) async {
    final response = await _db.child('subjects').child(day).once();
    if (response.snapshot.value == null) return ScheduleDay(name: day);
    Map<String, dynamic> subjectsMap =
        jsonDecode(jsonEncode(response.snapshot.value));
    return ScheduleDay.fromJson(subjectsMap);
  }

  @override
  Future<List<Item>> getShopList() async {
    final response = await _db.child('shopList').once();
    if (response.snapshot.value == null) return [];
    Map<String, dynamic> shopList = Map<String, dynamic>.from(
        response.snapshot.value as Map<dynamic, dynamic>);
    List<Item> list = [];
    shopList.forEach((key, item) {
      list.add(Item.fromJson({...item, 'id': key}));
    });
    return list;
  }

  @override
  Future<void> saveShopItem(Item item) async {
    try {
      DatabaseReference itemRef = _db.child('shopList').push();
      await itemRef.set(item.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> changeShopItem(Item item) async {
    final response = _db.child('shopList').child(item.id!);
    await response.update(item.copyWith(inCart: !item.inCart).toJson());
  }

  @override
  Future<void> createDay(ScheduleDay scheduleDay) async {
    await _db
        .child('subjects')
        .child(scheduleDay.name)
        .set(scheduleDay.toJson());
  }

  @override
  Future<void> updateDay(ScheduleDay scheduleDay) async {
    final response = _db.child('subjects').child(scheduleDay.name);
    await response.update(scheduleDay.toJson());
  }

  @override
  Future<void> removeShopItem(Item item) async {
    await _db.child('shopList').child(item.id!).remove();
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../models/item.dart';
import '../models/subject.dart';

class DBHelper {
  DBHelper._();

  static FirebaseDatabase _instance = FirebaseDatabase.instance
    ..setPersistenceEnabled(true);

  static DatabaseReference _db = _instance.reference()..keepSynced(true);

  static Future<Map<String, List<Subject>>> getSubjects() async {
    final subjects = await _db.child('subjects').once();
    Map<String, List<Subject>> schedule = {
      'Monday': [],
      'Tuesday': [],
      'Wednesday': [],
      'Thursday': [],
      'Friday': [],
    };
    if (subjects.snapshot.value == null) return schedule;
    Map<String, dynamic> subjectMap = Map<String, dynamic>.from(
        subjects.snapshot.value as Map<dynamic, dynamic>);
    subjectMap.forEach((day, subjects) {
      List<Subject> list = [];
      subjects.forEach((sub) {
        list.add(
          Subject(
            subcject: sub['subcject'],
            startTime: TimeOfDay(
              hour: sub['startTime']['hour'],
              minute: sub['startTime']['minute'],
            ),
            endTime: TimeOfDay(
              hour: sub['endTime']['hour'],
              minute: sub['endTime']['minute'],
            ),
            duration: double.parse(sub['duration'].toString()),
            lectureHall: sub['lectureHall'],
            subcjectType: sub['subcjectType'],
            professor: sub['professor'],
          ),
        );
      });
      schedule[day] = list;
    });
    return schedule;
  }

  static Future<void> addDay(
      List<Map<String, dynamic>> bodyData, String day) async {
    try {
      await _db.child('subjects').child(day).set(bodyData);
    } catch (e) {
      throw e;
    }
  }

  static Future<void> removeDay(String day) async {
    try {
      await _db.child('subjects').child(day).remove();
    } catch (e) {
      throw e;
    }
  }

  static Future<List<Item>> getShopList() async {
    final response = await _db.child('shopList').once();
    if (response.snapshot.value == null) return [];
    Map<String, dynamic> shopList = Map<String, dynamic>.from(
        response.snapshot.value as Map<dynamic, dynamic>);
    List<Item> list = [];
    shopList.forEach((key, item) {
      list.add(
        Item(
          id: key,
          name: item['name'],
          amount: item['amount'],
          inCart: item['inCart'],
        ),
      );
    });
    return list;
  }

  static Future<void> addShopItem(Map<String, dynamic> product) async {
    try {
      DatabaseReference itemRef = _db.child('shopList').push();
      itemRef.set(product);
    } catch (e) {
      throw e;
    }
  }

  static Future<void> removeShopItem(String productId) async {
    try {
      _db.child('shopList').child(productId).remove();
    } catch (e) {
      throw e;
    }
  }

  static Future<void> updateShopItem(
      Map<String, dynamic> map, String productId) async {
    await _db.child('shopList').child(productId).update(map);
  }
}

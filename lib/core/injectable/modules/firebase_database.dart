import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseDB {
  @injectable
  FirebaseDatabase get instance => FirebaseDatabase.instance;
}

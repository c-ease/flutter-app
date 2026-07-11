import 'package:sqflite/sqflite.dart';

abstract class Migration {
  int get version;

  Future<void> migrate(Database db);
}
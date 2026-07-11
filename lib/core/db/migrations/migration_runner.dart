import 'package:quote/core/db/migrations/001_initial.dart';
import 'package:quote/core/db/migrations/002_add_created_at.dart';
import 'package:quote/core/db/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationRunner {
  MigrationRunner._();

  static final List<Migration> _migrations = [
    InitialMigration(),
    AddCreatedAtMigration(),
  ];

  static Future<void> migrate(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    for (final migration in _migrations) {
      if (migration.version > oldVersion &&
          migration.version <= newVersion) {
        await migration.migrate(db);
      }
    }
  }
}
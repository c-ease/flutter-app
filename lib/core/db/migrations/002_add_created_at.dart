import 'package:quote/core/db/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class AddCreatedAtMigration extends Migration {
  @override
  int get version => 2;

  @override
  Future<void> migrate(Database db) async {
    await db.execute('''
      ALTER TABLE bank_account
      ADD COLUMN created_at INTEGER NOT NULL DEFAULT 0
    ''');
  }
}
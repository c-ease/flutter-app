import 'package:quote/core/db/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class InitialMigration extends Migration {
  @override
  int get version => 1;

  @override
  Future<void> migrate(Database db) async {
    await db.execute('''
      CREATE TABLE bank_account (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        type TEXT NOT NULL,
        balance REAL NOT NULL,
        init_balance REAL NOT NULL
      )
    ''');
  }
}
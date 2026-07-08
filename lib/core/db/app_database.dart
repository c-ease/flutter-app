import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:quote/core/db/table_adapter.dart';
import 'package:quote/features/bank_account/data/adapters/bank_account_adapter.dart';

class AppDatabase {
  AppDatabase._();

  static final AppDatabase instance = AppDatabase._();

  static const String _dbName = 'quote.db';
  static const int _dbVersion = 1;

  Database? _database;

  final List<TableAdapter<dynamic>> _adapters = [
    BankAccountAdapter(),
  ];

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _openDatabase();
    return _database!;
  }

  Future<Database> _openDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    for (final adapter in _adapters) {
      await db.execute(adapter.createTableQuery);
    }
  }
}
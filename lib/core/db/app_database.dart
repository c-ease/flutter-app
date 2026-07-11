import 'package:path/path.dart';
import 'package:quote/core/db/migrations/migration_runner.dart';
import 'package:quote/core/logging/app_log_tag.dart';
import 'package:quote/core/logging/app_logger.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();

  static final AppDatabase instance = AppDatabase._();

  static const String _dbName = 'quote.db';
  static const int _dbVersion = 2;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _openDatabase();
    return _database!;
  }

  Future<Database> _openDatabase() async {
    try {
      AppLogger.info(
        'Opening database ($_dbName) with schema version $_dbVersion.',
        tag: AppLogTag.database,
      );

      final dbPath = await getDatabasesPath();
      final path = join(dbPath, _dbName);

      final database = await openDatabase(
        path,
        version: _dbVersion,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
      );

      AppLogger.info(
        'Database opened successfully.',
        tag: AppLogTag.database,
      );

      return database;
    } catch (e, st) {
      AppLogger.error(
        'Failed to open database.',
        tag: AppLogTag.database,
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> _onCreate(
    Database db,
    int version,
  ) async {
    AppLogger.info(
      'Creating database schema (version $version).',
      tag: AppLogTag.database,
    );

    await MigrationRunner.migrate(
      db,
      0,
      version,
    );
  }

  Future<void> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    AppLogger.info(
      'Upgrading database from version $oldVersion to $newVersion.',
      tag: AppLogTag.database,
    );

    await MigrationRunner.migrate(
      db,
      oldVersion,
      newVersion,
    );
  }
}
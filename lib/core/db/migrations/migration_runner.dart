import 'package:quote/core/db/migrations/001_initial.dart';
import 'package:quote/core/db/migrations/002_add_created_at.dart';
import 'package:quote/core/db/migrations/migration.dart';
import 'package:quote/core/logging/app_log_tag.dart';
import 'package:quote/core/logging/app_logger.dart';
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
        AppLogger.info(
          'Running migration v${migration.version}.',
          tag: AppLogTag.migration,
        );

        try {
          await migration.migrate(db);

          AppLogger.info(
            'Migration v${migration.version} completed.',
            tag: AppLogTag.migration,
          );
        } catch (e, st) {
          AppLogger.error(
            'Migration v${migration.version} failed.',
            tag: AppLogTag.migration,
            error: e,
            stackTrace: st,
          );
          rethrow;
        }
      }
    }
  }
}
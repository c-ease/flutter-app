import 'package:sqflite/sqflite.dart';
import 'package:quote/core/db/app_database.dart';
import 'package:quote/core/db/table_adapter.dart';

class GenericRepository<T> {
  final AppDatabase appDatabase;
  final TableAdapter<T> adapter;

  GenericRepository({
    required this.appDatabase,
    required this.adapter,
  });

  Future<Database> get _db async => appDatabase.database;

  Future<int> insert(T item) async {
    final db = await _db;

    return db.insert(
      adapter.tableName,
      adapter.toMap(item),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<T>> getAll({
    String? orderBy,
  }) async {
    final db = await _db;

    final rows = await db.query(
      adapter.tableName,
      orderBy: orderBy,
    );

    return rows.map(adapter.fromMap).toList();
  }

  Future<T?> getById(String id) async {
    final db = await _db;

    final rows = await db.query(
      adapter.tableName,
      where: '${adapter.primaryKey} = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (rows.isEmpty) {
      return null;
    }

    return adapter.fromMap(rows.first);
  }

  Future<int> update(T item) async {
    final db = await _db;
    final map = adapter.toMap(item);
    final id = map[adapter.primaryKey];

    if (id == null) {
      throw Exception('Cannot update item without primary key value');
    }

    return db.update(
      adapter.tableName,
      map,
      where: '${adapter.primaryKey} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteById(String id) async {
    final db = await _db;

    return db.delete(
      adapter.tableName,
      where: '${adapter.primaryKey} = ?',
      whereArgs: [id],
    );
  }
}
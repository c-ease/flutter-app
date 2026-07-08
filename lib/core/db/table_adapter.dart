abstract class TableAdapter<T> {
  String get tableName;
  String get primaryKey;
  String get createTableQuery;

  Map<String, dynamic> toMap(T item);
  T fromMap(Map<String, dynamic> map);
}
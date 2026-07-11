abstract class TableAdapter<T> {
  String get tableName;
  String get primaryKey;

  Map<String, dynamic> toMap(T item);
  T fromMap(Map<String, dynamic> map);
}
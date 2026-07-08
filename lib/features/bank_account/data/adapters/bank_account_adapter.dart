import 'package:quote/core/db/table_adapter.dart';
import 'package:quote/features/bank_account/data/models/bank_account.dart';

class BankAccountAdapter extends TableAdapter<BankAccount> {
  @override
  String get tableName => 'bank_account';

  @override
  String get primaryKey => 'id';

  @override
  String get createTableQuery => '''
    CREATE TABLE bank_account (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      type TEXT NOT NULL,
      balance REAL NOT NULL,
      init_balance REAL NOT NULL
    )
  ''';

  @override
  Map<String, dynamic> toMap(BankAccount item) {
    return {
      'id': item.id,
      'name': item.name,
      'type': item.type,
      'balance': item.balance,
      'init_balance': item.initBalance,
    };
  }

  @override
  BankAccount fromMap(Map<String, dynamic> map) {
    return BankAccount(
      id: map['id'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      balance: (map['balance'] as num).toDouble(),
      initBalance: (map['init_balance'] as num).toDouble(),
    );
  }
}
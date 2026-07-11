import 'package:uuid/uuid.dart';
import 'package:quote/core/db/app_database.dart';
import 'package:quote/core/db/database_repository.dart';
import 'package:quote/features/bank_account/data/adapters/bank_account_adapter.dart';
import 'package:quote/features/bank_account/data/models/bank_account.dart';

class BankAccountRepository {
  BankAccountRepository({
    DatabaseRepository<BankAccount>? repository,
  }) : _repository = repository ??
            DatabaseRepository<BankAccount>(
              database: AppDatabase.instance,
              adapter: BankAccountAdapter(),
            );

  final DatabaseRepository<BankAccount> _repository;
  final Uuid _uuid = const Uuid();

  static const String _dummyAccountTypeId =
      '00000000-0000-0000-0000-000000000001';

  Future<void> createBankAccount({
    required String name,
    required double initialBalance,
  }) async {
    final account = BankAccount(
      id: _uuid.v4(),
      name: name,
      type: _dummyAccountTypeId,
      balance: initialBalance,
      initBalance: initialBalance,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    await _repository.insert(account);
  }

  Future<List<BankAccount>> getAllBankAccounts({
    bool ascending = false,
  }) {
    return _repository.getAll(
      orderBy: 'created_at ${ascending ? 'ASC' : 'DESC'}',
    );
  }

  Future<BankAccount?> getBankAccountById(String id) {
    return _repository.getById(id);
  }

  Future<void> deleteBankAccount(String id) async {
    await _repository.deleteById(id);
  }
}
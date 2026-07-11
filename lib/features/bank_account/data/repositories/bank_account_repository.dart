import 'package:quote/core/db/app_database.dart';
import 'package:quote/core/db/database_repository.dart';
import 'package:quote/core/logging/app_log_tag.dart';
import 'package:quote/core/logging/app_logger.dart';
import 'package:quote/features/bank_account/data/adapters/bank_account_adapter.dart';
import 'package:quote/features/bank_account/data/models/bank_account.dart';
import 'package:uuid/uuid.dart';

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
    AppLogger.info(
      'Creating bank account.',
      tag: AppLogTag.repository,
    );

    try {
      final account = BankAccount(
        id: _uuid.v4(),
        name: name,
        type: _dummyAccountTypeId,
        balance: initialBalance,
        initBalance: initialBalance,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      await _repository.insert(account);

      AppLogger.info(
        'Bank account created successfully.',
        tag: AppLogTag.repository,
      );
    } catch (e, st) {
      AppLogger.error(
        'Failed to create bank account.',
        tag: AppLogTag.repository,
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<List<BankAccount>> getAllBankAccounts({
    bool ascending = false,
  }) async {
    AppLogger.debug(
      'Loading bank accounts.',
      tag: AppLogTag.repository,
    );

    try {
      return await _repository.getAll(
        orderBy: 'created_at ${ascending ? 'ASC' : 'DESC'}',
      );
    } catch (e, st) {
      AppLogger.error(
        'Failed to load bank accounts.',
        tag: AppLogTag.repository,
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<BankAccount?> getBankAccountById(String id) async {
    AppLogger.debug(
      'Fetching bank account.',
      tag: AppLogTag.repository,
    );

    try {
      return await _repository.getById(id);
    } catch (e, st) {
      AppLogger.error(
        'Failed to fetch bank account.',
        tag: AppLogTag.repository,
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> deleteBankAccount(String id) async {
    AppLogger.info(
      'Deleting bank account.',
      tag: AppLogTag.repository,
    );

    try {
      await _repository.deleteById(id);

      AppLogger.info(
        'Bank account deleted successfully.',
        tag: AppLogTag.repository,
      );
    } catch (e, st) {
      AppLogger.error(
        'Failed to delete bank account.',
        tag: AppLogTag.repository,
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
import 'package:flutter/material.dart';
import 'package:quote/core/logging/app_log_tag.dart';
import 'package:quote/core/logging/app_logger.dart';
import 'package:quote/core/theme/theme_controller.dart';
import 'package:quote/core/ui/feedback/app_snackbar.dart';
import 'package:quote/core/ui/layout/app_gap.dart';
import 'package:quote/core/ui/layout/app_page.dart';
import 'package:quote/features/bank_account/data/models/bank_account.dart';
import 'package:quote/features/bank_account/data/repositories/bank_account_repository.dart';
import 'package:quote/features/bank_account/presentation/widgets/add_bank_account_form.dart';
import 'package:quote/features/bank_account/presentation/widgets/bank_account_list.dart';
import 'package:quote/features/dashboard/presentation/widgets/dashboard_header.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final BankAccountRepository _repository =
      BankAccountRepository();

  final GlobalKey<AddBankAccountFormState>
  _formKey =
      GlobalKey<AddBankAccountFormState>();

  List<BankAccount> _accounts = [];

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();

    AppLogger.info(
      'Dashboard opened.',
      tag: AppLogTag.ui,
    );

    _loadAccounts();
  }

  Future<void> _loadAccounts() async {
    try {
      final accounts =
          await _repository.getAllBankAccounts();

      if (!mounted) return;

      setState(() {
        _accounts = accounts;
      });
    } catch (_) {
      if (!mounted) return;

      AppSnackbar.showError(
        context,
        message: 'Failed to load bank accounts.',
      );
    }
  }

  Future<void> _saveBankAccount(
    String name,
    double initialBalance,
  ) async {
    setState(() {
      _isSaving = true;
    });

    try {
      await _repository.createBankAccount(
        name: name,
        initialBalance: initialBalance,
      );

      await _loadAccounts();

      _formKey.currentState?.clear();

      if (!mounted) return;

      AppSnackbar.showSuccess(
        context,
        message: 'Bank account added successfully.',
      );
    } catch (_) {
      if (!mounted) return;

      AppSnackbar.showError(
        context,
        message: 'Failed to add bank account.',
      );
    } finally {
      if (!mounted) return;

      setState(() {
        _isSaving = false;
      });
    }
  }

  void _toggleTheme() {
    ThemeController.instance.toggleTheme();

    AppLogger.info(
      'Theme toggled.',
      tag: AppLogTag.ui,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppPage(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch,
            children: [
              DashboardHeader(
                isDarkMode:
                    ThemeController.instance.themeMode ==
                    ThemeMode.dark,
                onToggleTheme: _toggleTheme,
              ),

              const AppGap.lg(),

              AddBankAccountForm(
                key: _formKey,
                isSaving: _isSaving,
                onSave: _saveBankAccount,
              ),

              const AppGap.xl(),

              BankAccountList(
                accounts: _accounts,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:quote/core/logging/app_log_tag.dart';
import 'package:quote/core/logging/app_logger.dart';
import 'package:quote/core/theme/theme_controller.dart';
import 'package:quote/core/ui/layout/app_gap.dart';
import 'package:quote/core/ui/layout/app_page.dart';
import 'package:quote/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:quote/features/bank_account/presentation/widgets/add_bank_account_form.dart';
import 'package:quote/features/bank_account/data/models/bank_account.dart';
import 'package:quote/features/bank_account/presentation/widgets/bank_account_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<BankAccount> _accounts = [];
  
  @override
  void initState() {
    super.initState();

    AppLogger.info(
      'Dashboard opened.',
      tag: AppLogTag.ui,
    );
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DashboardHeader(
                isDarkMode:
                    ThemeController.instance.themeMode ==
                    ThemeMode.dark,
                onToggleTheme: _toggleTheme,
              ),

              const AppGap.lg(),

              AddBankAccountForm(
                isSaving: false,
                onSave: (
                  name,
                  initialBalance,
                ) async {
                  // Step 5
                  // Persist using repository
                  // Refresh list
                  // Show snackbar
                  // Log operation
                },
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
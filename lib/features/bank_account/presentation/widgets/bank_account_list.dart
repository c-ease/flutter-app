import 'package:flutter/material.dart';

import 'package:quote/core/ui/cards/app_card.dart';
import 'package:quote/core/ui/layout/app_gap.dart';
import 'package:quote/core/ui/layout/app_section.dart';
import 'package:quote/core/ui/tables/app_row_action.dart';
import 'package:quote/core/ui/tables/app_selectable_row.dart';
import 'package:quote/core/utils/currency_formatter.dart';
import 'package:quote/features/bank_account/data/models/bank_account.dart';

class BankAccountList extends StatefulWidget {
  const BankAccountList({super.key, required this.accounts});

  final List<BankAccount> accounts;

  @override
  State<BankAccountList> createState() => _BankAccountListState();
}

class _BankAccountListState extends State<BankAccountList> {
  String? _selectedAccountId;

  void _toggleSelection(BankAccount account) {
    setState(() {
      if (_selectedAccountId == account.id) {
        _selectedAccountId = null;
      } else {
        _selectedAccountId = account.id;
      }
    });
  }

  void _editAccount(BankAccount account) {
    // Edit functionality will be implemented later.
  }

  void _deleteAccount(BankAccount account) {
    // Delete functionality will be implemented later.
  }

  @override
  Widget build(BuildContext context) {
    return AppSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Bank Accounts', style: Theme.of(context).textTheme.titleLarge),
          const AppGap.md(),

          if (widget.accounts.isEmpty)
            const AppCard(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text('No bank accounts added yet.'),
                ),
              ),
            )
          else
            Column(
              children: [
                for (final account in widget.accounts) ...[
                  AppCard(
                    padding: EdgeInsets.zero,
                    child: AppSelectableRow(
                      selected: _selectedAccountId == account.id,
                      onTap: () => _toggleSelection(account),
                      actions: [
                        AppRowAction(
                          icon: Icons.edit_outlined,
                          tooltip: 'Edit account',
                          onPressed: () => _editAccount(account),
                        ),
                        AppRowAction(
                          icon: Icons.delete_outline,
                          tooltip: 'Delete account',
                          onPressed: () => _deleteAccount(account),
                        ),
                      ],
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              account.name,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Text(
                            CurrencyFormatter.format(account.balance),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const AppGap.sm(),
                ],
              ],
            ),
        ],
      ),
    );
  }
}

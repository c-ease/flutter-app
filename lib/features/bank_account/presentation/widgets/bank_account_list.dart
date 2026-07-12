import 'package:flutter/material.dart';
import 'package:quote/core/ui/cards/app_card.dart';
import 'package:quote/core/ui/layout/app_gap.dart';
import 'package:quote/core/ui/layout/app_section.dart';
import 'package:quote/core/utils/currency_formatter.dart';
import 'package:quote/features/bank_account/data/models/bank_account.dart';

class BankAccountList extends StatelessWidget {
  const BankAccountList({
    super.key,
    required this.accounts,
  });

  final List<BankAccount> accounts;

  @override
  Widget build(BuildContext context) {
    return AppSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Bank Accounts',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const AppGap.md(),
          if (accounts.isEmpty)
            const AppCard(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    'No bank accounts added yet.',
                  ),
                ),
              ),
            )
          else
            Column(
              children: [
                for (final account in accounts) ...[
                  AppCard(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            account.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge,
                          ),
                        ),
                        Text(
                          CurrencyFormatter.format(
                            account.balance,
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                        ),
                      ],
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
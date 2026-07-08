import 'package:flutter/material.dart';
import 'package:quote/features/bank_account/data/repositories/bank_account_service.dart';

class AddBankAccountScreen extends StatefulWidget {
  const AddBankAccountScreen({super.key});

  @override
  State<AddBankAccountScreen> createState() => _AddBankAccountScreenState();
}

class _AddBankAccountScreenState extends State<AddBankAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _initialBalanceController = TextEditingController();

  final BankAccountService _bankAccountService = BankAccountService();

  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _initialBalanceController.dispose();
    super.dispose();
  }

  Future<void> _saveBankAccount() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final name = _nameController.text.trim();
    final initialBalance = double.parse(_initialBalanceController.text.trim());

    setState(() {
      _isSaving = true;
    });

    try {
      await _bankAccountService.createBankAccount(
        name: name,
        initialBalance: initialBalance,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bank account added successfully'),
        ),
      );

      Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save bank account: $e'),
        ),
      );
    } finally {
      if (!mounted) return;

      setState(() {
        _isSaving = false;
      });
    }
  }

  String? _validateName(String? value) {
    final trimmed = value?.trim() ?? '';

    if (trimmed.isEmpty) {
      return 'Please enter account name';
    }

    return null;
  }

  String? _validateInitialBalance(String? value) {
    final trimmed = value?.trim() ?? '';

    if (trimmed.isEmpty) {
      return 'Please enter initial balance';
    }

    final parsed = double.tryParse(trimmed);
    if (parsed == null) {
      return 'Please enter a valid number';
    }

    if (parsed < 0) {
      return 'Initial balance cannot be negative';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bank Account'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Account name',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateName,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _initialBalanceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Initial balance',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateInitialBalance,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isSaving ? null : _saveBankAccount,
                    child: _isSaving
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
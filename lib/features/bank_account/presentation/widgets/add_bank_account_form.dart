import 'package:flutter/material.dart';
import 'package:quote/core/ui/buttons/app_button.dart';
import 'package:quote/core/ui/buttons/app_button_variant.dart';
import 'package:quote/core/ui/cards/app_card.dart';
import 'package:quote/core/ui/inputs/app_text_field.dart';
import 'package:quote/core/ui/layout/app_gap.dart';

class AddBankAccountForm extends StatefulWidget {
  const AddBankAccountForm({
    super.key,
    required this.isSaving,
    required this.onSave,
  });

  final bool isSaving;

  final Future<void> Function(
    String name,
    double initialBalance,
  ) onSave;

  @override
  State<AddBankAccountForm> createState() =>
      AddBankAccountFormState();
}

class AddBankAccountFormState
    extends State<AddBankAccountForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _balanceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'Please enter account name';
    }

    return null;
  }

  String? _validateBalance(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'Please enter initial balance';
    }

    final amount = double.tryParse(text);

    if (amount == null) {
      return 'Please enter a valid number';
    }

    if (amount < 0) {
      return 'Initial balance cannot be negative';
    }

    return null;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    await widget.onSave(
      _nameController.text.trim(),
      double.parse(_balanceController.text.trim()),
    );
  }

  void clear() {
    _formKey.currentState?.reset();

    _nameController.clear();
    _balanceController.clear();

    FocusScope.of(context).unfocus();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Bank Account',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const AppGap.md(),
            AppTextField(
              controller: _nameController,
              label: 'Account name',
              textInputAction: TextInputAction.next,
              validator: _validateName,
            ),
            const AppGap.md(),
            AppTextField(
              controller: _balanceController,
              label: 'Initial balance',
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              validator: _validateBalance,
            ),
            const AppGap.lg(),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: 'Cancel',
                    expanded: false,
                    variant: AppButtonVariant.outlined,
                    onPressed: clear,
                  ),
                ),
                const AppGap.md(),
                Expanded(
                  child: AppButton(
                    label: 'Save',
                    expanded: false,
                    loading: widget.isSaving,
                    onPressed:
                        widget.isSaving ? null : _submit,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
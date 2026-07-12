import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.enabled = true,
    this.obscureText = false,
    this.autofocus = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.sentences,
  });

  final TextEditingController? controller;

  final String? label;
  final String? hint;

  final String? Function(String?)? validator;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  final bool enabled;
  final bool obscureText;
  final bool autofocus;
  final bool readOnly;

  final int maxLines;
  final int? minLines;
  final int? maxLength;

  final FocusNode? focusNode;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final VoidCallback? onTap;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;

  final List<TextInputFormatter>? inputFormatters;

  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      enabled: enabled,
      obscureText: obscureText,
      autofocus: autofocus,
      readOnly: readOnly,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
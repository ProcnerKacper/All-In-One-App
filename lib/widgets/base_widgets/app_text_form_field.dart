import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.label,
    this.initialValue,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.padding = EdgeInsets.zero,
    Key? key,
  }) : super(key: key);

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String label;
  final String? initialValue;
  final EdgeInsets padding;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        decoration: InputDecoration(labelText: label),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}

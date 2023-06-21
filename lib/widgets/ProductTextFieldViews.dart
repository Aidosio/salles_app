import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class ProductTextFieldViews extends StatelessWidget {
  final String hintTextExample;
  final String labelTextExample;
  final bool isPhone;
  final bool isEnabled;
  final String? initialValue;
  final void Function(String) onChanged; // Добавлен колбэк onChanged
  const ProductTextFieldViews({
    Key? key,
    required this.initialValue,
    required this.isEnabled,
    required this.isPhone,
    required this.hintTextExample,
    required this.labelTextExample,
    required this.onChanged, // Добавлен параметр onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: TextField(
        enabled: isEnabled,
        keyboardType: isPhone ? TextInputType.phone : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintTextExample,
          labelText: labelTextExample,
        ),
        onChanged: onChanged, // Привязываем onChanged к текстовому полю
      ),
    );
  }
}

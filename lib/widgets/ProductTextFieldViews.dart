import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class ProductTextFieldViews extends StatelessWidget {
  final String hintTextExample;
  final String labelTextExample;
  final bool isPhone;
  final bool isEnabled;
  final String? initialValue;
  const ProductTextFieldViews({
    Key? key,
    required this.initialValue,
    required this.isEnabled,
    required this.isPhone,
    required this.hintTextExample,
    required this.labelTextExample,
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
      ),
    );
  }
}

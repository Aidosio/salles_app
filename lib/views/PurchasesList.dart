import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class PurchasesList extends StatefulWidget {
  const PurchasesList({super.key});

  @override
  State<PurchasesList> createState() => _PurchasesListState();
}

class _PurchasesListState extends State<PurchasesList> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Align(
              alignment: Alignment.center, child: Text("Here is body)))"))),
    );
  }
}

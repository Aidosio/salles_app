import 'package:flutter/material.dart';
import 'package:salles_app/views/PurchasesList.dart';
import 'package:salles_app/widgets/SalesHistoryWidget.dart';

import '../locale/AppLocalizations.dart';

class SalesViews2 extends StatefulWidget {
  const SalesViews2({Key? key}) : super(key: key);

  @override
  State<SalesViews2> createState() => _SalesViewsState();
}

class _SalesViewsState extends State<SalesViews2> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: TabBar(
          isScrollable: true,
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.symmetric(horizontal: 30),
          tabs: <Widget>[
            Tab(
              text: localizations?.todayText ?? '',
              // "Сегодня",
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: TabBarView(children: <Widget>[
          PurchasesList(),
        ]),
      ),
    );
  }
}

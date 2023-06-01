import 'package:flutter/material.dart';
import 'package:salles_app/widgets/SalesHistoryWidget.dart';

import '../locale/AppLocalizations.dart';

class SalesViews extends StatefulWidget {
  const SalesViews({Key? key}) : super(key: key);

  @override
  State<SalesViews> createState() => _SalesViewsState();
}

class _SalesViewsState extends State<SalesViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    bool _isOpened = true;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              ExpansionTile(
                initiallyExpanded: _isOpened,
                key: Key('firstExpansionTile'),
                title: Text('Сегодня'),
                trailing: Icon(Icons.arrow_drop_down_rounded),
                children: [
                  Column(
                    children: [
                      SalesHistoryWidget(checkNum: '11122332123', price: '100'),
                      SalesHistoryWidget(checkNum: 'asd', price: 'price'),
                      SalesHistoryWidget(checkNum: '11122332123', price: '100'),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                key: Key('secondExpansionTile'),
                title: Text('Вчера'),
                trailing: Icon(Icons.arrow_drop_down_rounded),
                children: [
                  Column(
                    children: [
                      SalesHistoryWidget(checkNum: '11122332123', price: '100'),
                      SalesHistoryWidget(checkNum: 'asd', price: 'price'),
                      SalesHistoryWidget(checkNum: '11122332123', price: '100'),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                key: Key('thirdExpansionTile'),
                title: Text('Прошлая неделя'),
                trailing: Icon(Icons.arrow_drop_down_rounded),
                children: [
                  Column(
                    children: [
                      SalesHistoryWidget(checkNum: '11122332123', price: '100'),
                      SalesHistoryWidget(checkNum: 'asd', price: 'price'),
                      SalesHistoryWidget(checkNum: '11122332123', price: '100'),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                key: Key('fourthExpansionTile'),
                title: Text('Прошлые месяца'),
                trailing: Icon(Icons.arrow_drop_down_rounded),
                children: [
                  Column(
                    children: [
                      SalesHistoryWidget(checkNum: '11122332123', price: '100'),
                      SalesHistoryWidget(checkNum: 'asd', price: 'price'),
                      SalesHistoryWidget(checkNum: '11122332123', price: '100'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

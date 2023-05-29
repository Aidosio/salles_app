import 'package:flutter/material.dart';
import 'package:salles_app/widgets/SalesHistoryWidget.dart';

import '../locale/AppLocalizations.dart';

class SalesViews extends StatefulWidget {
  const SalesViews({super.key});

  @override
  State<SalesViews> createState() => _SalesViewsState();
}

class _SalesViewsState extends State<SalesViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: const Column(
            // УБЕРИ ЭТОТ КОНСТ
            children: [
              Column(
                children: [
                  Column(children: [
                    ExpansionTile(
                      title: Text('Today'),
                      trailing: Icon(Icons.arrow_drop_down_rounded),
                      children: [
                        Column(children: [
                          SalesHistoryWidget(
                              checkNum: '11122332123', price: '100'),
                          SalesHistoryWidget(checkNum: 'asd', price: 'price'),
                          SalesHistoryWidget(
                              checkNum: '11122332123', price: '100'),
                        ])
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Today'),
                      trailing: Icon(Icons.arrow_drop_down_rounded),
                      children: [
                        Column(children: [
                          SalesHistoryWidget(
                              checkNum: '11122332123', price: '100'),
                          SalesHistoryWidget(checkNum: 'asd', price: 'price'),
                          SalesHistoryWidget(
                              checkNum: '11122332123', price: '100'),
                        ])
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Today'),
                      trailing: Icon(Icons.arrow_drop_down_rounded),
                      children: [
                        Column(children: [
                          SalesHistoryWidget(
                              checkNum: '11122332123', price: '100'),
                          SalesHistoryWidget(checkNum: 'asd', price: 'price'),
                          SalesHistoryWidget(
                              checkNum: '11122332123', price: '100'),
                        ])
                      ],
                    ),
                  ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

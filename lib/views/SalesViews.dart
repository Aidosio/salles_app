import 'package:flutter/material.dart';
import 'package:salles_app/widgets/SalesCodeWidget.dart';

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
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          ExpansionTile(
            title: Text('Today'),
            trailing: Icon(Icons.arrow_drop_down_rounded),
            children: [
              SalesCodeWidget(checkNum: 'asd', price: 'price'),
              SalesCodeWidget(checkNum: 'asd', price: 'price'),
              SalesCodeWidget(checkNum: 'asd', price: 'price'),
            ],
          ),
          ExpansionTile(
            title: Text('Today'),
            trailing: Icon(Icons.arrow_drop_down_rounded),
            children: [
              SalesCodeWidget(checkNum: 'asd', price: 'price'),
              SalesCodeWidget(checkNum: 'asd', price: 'price'),
              SalesCodeWidget(checkNum: 'asd', price: 'price'),
            ],
          ),
          ExpansionTile(
            title: Text('Today'),
            trailing: Icon(Icons.arrow_drop_down_rounded),
            children: [
              SalesCodeWidget(checkNum: 'asd', price: 'price'),
              SalesCodeWidget(checkNum: 'asd', price: 'price'),
              SalesCodeWidget(checkNum: 'asd', price: 'price'),
            ],
          ),
        ],
      ),
    );
  }
}

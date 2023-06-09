import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';
import '../widgets/MyBarWidget.dart';
import '../widgets/SalesRefundAcceptionCardWidgets.dart';

class SalesRefundAcceptionViews extends StatefulWidget {
  const SalesRefundAcceptionViews({super.key});

  @override
  State<SalesRefundAcceptionViews> createState() =>
      _SalesRefundAcceptionViewsState();
}

class _SalesRefundAcceptionViewsState extends State<SalesRefundAcceptionViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    SalesRefundAcceptionCardWidgets(),
                    SalesRefundAcceptionCardWidgets(),
                  ],
                ),
              ),
            ),
          ),
          MyBarWidget(
              totalPrice: '7000',
              buttonTitle: 'Закончить',
              id: '2',
              popBack: false,
              routeWay: null,
              totalRefund: '5000',
              isVisible: false),
        ],
      ),
    );
  }
}

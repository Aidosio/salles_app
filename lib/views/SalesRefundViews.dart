import 'package:flutter/material.dart';
import 'package:salles_app/widgets/MyBarWidget.dart';
import '../locale/AppLocalizations.dart';
import '../widgets/SalesRefundWidgets.dart';

class SalesRefundViews extends StatefulWidget {
  const SalesRefundViews({super.key});

  @override
  State<SalesRefundViews> createState() => _SalesRefundViewsState();
}

class _SalesRefundViewsState extends State<SalesRefundViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('Refund'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    SalesRefundWidgets(),
                    SalesRefundWidgets(),
                    SalesRefundWidgets(),
                    SalesRefundWidgets(),
                    SalesRefundWidgets(),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Возврат',
                            style: TextStyle(
                                fontSize: typography.bodyMedium?.fontSize,
                                fontWeight: FontWeight.w600),
                          ),
                          Divider(),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                    SalesRefundWidgets(),
                    SalesRefundWidgets(),
                    SalesRefundWidgets(),
                    SalesRefundWidgets(),
                    SalesRefundWidgets(),
                  ],
                ),
              ),
            ),
          ),
          MyBarWidget(
              totalPrice: '6666',
              buttonTitle: 'Возврат',
              id: '1',
              popBack: true,
              routeWay: '/sales-refund-Accept',
              totalRefund: '6000',
              isVisible: true),
        ],
      ),
    );
  }
}

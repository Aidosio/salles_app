import 'package:flutter/material.dart';
import 'package:salles_app/service/SalesService.dart';

import '../locale/AppLocalizations.dart';

class MyBarWidget extends StatefulWidget {
  final String totalPrice;
  final String buttonTitle;
  final String id;
  final String? routeWay;
  final String totalRefund;
  final bool isVisible;
  final bool popBack;

  const MyBarWidget({
    Key? key,
    required this.totalPrice,
    required this.buttonTitle,
    required this.id,
    this.routeWay,
    required this.totalRefund,
    required this.isVisible,
    required this.popBack,
  }) : super(key: key);

  @override
  _MyBarWidgetState createState() => _MyBarWidgetState();
}

class _MyBarWidgetState extends State<MyBarWidget> {
  String currentTotalPrice = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    calculateTotalPrice(String id) async {
      String? totalPrices = await SalesService().calculateTotalPrice(id);
      setState(() {
        currentTotalPrice = totalPrices!;
      });
      print(totalPrices);
      Navigator.popUntil(context, (route) => route.isFirst);
    }

    TextTheme typography = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(right: 22, left: 22, bottom: 20),
      child: Column(
        children: [
          SizedBox(height: 10),
          Divider(
            height: 1,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                localizations?.totalAmount ?? '',
                // 'Общая сумма: ',
                style: TextStyle(
                  fontSize: typography.bodyMedium?.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(currentTotalPrice == ''
                  ? widget.totalPrice + ' тг'
                  : currentTotalPrice + ' тг'),
            ],
          ),
          SizedBox(height: 16),
          widget.isVisible
              ? Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Возврат:',
                    //       style: TextStyle(
                    //         fontSize: typography.bodyMedium?.fontSize,
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    //     ),
                    //     Text(widget.totalRefund + ' тг'),
                    //   ],
                    // ),
                    // SizedBox(height: 10),
                  ],
                )
              : Container(),
          Container(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                if (widget.popBack && widget.routeWay != null) {
                  Navigator.pushNamed(context, widget.routeWay!,
                      arguments: widget.id);
                } else {
                  calculateTotalPrice(widget.id);
                }
                print(widget.id);
              },
              child: Text(widget.buttonTitle),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(0, 40),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

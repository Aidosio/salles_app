import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class MyBarWidget extends StatelessWidget {
  final String totalPrice;
  final String buttonTitle;
  final String id;
  final String routeWay;
  final String totalRefund;
  final bool isVisible;
  const MyBarWidget(
      {Key? key,
      required this.totalPrice,
      required this.buttonTitle,
      required this.id,
      required this.routeWay,
      required this.totalRefund,
      required this.isVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(right: 22, left: 22, bottom: 20),
      child: Column(
        children: [
          SizedBox(height: 10),
          Divider(
            height: 1,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Общая сумма:',
                style: TextStyle(
                  fontSize: typography.bodyMedium?.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(totalPrice + ' тг')
            ],
          ),
          SizedBox(height: 10),
          isVisible
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Возврат:',
                          style: TextStyle(
                            fontSize: typography.bodyMedium?.fontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(totalRefund + ' тг'),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                )
              : Container(),
          Container(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, routeWay);
                print(id);
              },
              child: Text(buttonTitle),
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

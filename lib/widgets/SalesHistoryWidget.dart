import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class SalesHistoryWidget extends StatelessWidget {
  final String checkNum;
  final String price;
  const SalesHistoryWidget({
    Key? key,
    required this.checkNum,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Container(
        margin: EdgeInsets.only(bottom: 15),
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/sales-refund', arguments: checkNum);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      localizations?.chequeColon ?? '',
                      // '№ Чека:',
                      style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      checkNum.length > 20
                          ? '${checkNum.substring(0, 20)}...'
                          : checkNum,
                      style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      localizations?.amountColon ?? '',
                      // 'Сумма: ',
                      style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      price + ' тг',
                      style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

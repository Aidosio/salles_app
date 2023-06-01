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
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/sales-refund',
                arguments: 'Возврат и просмотр');
          },
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('№ Чека:',
                          style: TextStyle(
                              fontWeight: typography.bodyMedium?.fontWeight)),
                      Text(
                        checkNum,
                        style: TextStyle(
                            fontWeight: typography.bodyMedium?.fontWeight),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Сумма:',
                          style: TextStyle(
                              fontWeight: typography.bodyMedium?.fontWeight)),
                      Text(
                        price + ' тг',
                        style: TextStyle(
                            fontWeight: typography.bodyMedium?.fontWeight),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

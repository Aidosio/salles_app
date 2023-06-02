import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class SalesRefundWidgets extends StatelessWidget {
  const SalesRefundWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
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
          Navigator.pushNamed(context, '/category-views',
              arguments: 'Овощи и фрукты');
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Название товара:',
                      style: TextStyle(
                          fontWeight: typography.bodyMedium?.fontWeight)),
                  Text(
                    'Яблоки',
                    style: TextStyle(
                        fontWeight: typography.bodyMedium?.fontWeight),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Цена:',
                      style: TextStyle(
                          fontWeight: typography.bodyMedium?.fontWeight)),
                  Text(
                    '10000' + ' тг',
                    style: TextStyle(
                        fontWeight: typography.bodyMedium?.fontWeight),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Кол-во:',
                      style: TextStyle(
                          fontWeight: typography.bodyMedium?.fontWeight)),
                  Text(
                    '10' + ' шт',
                    style: TextStyle(
                        fontWeight: typography.bodyMedium?.fontWeight),
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

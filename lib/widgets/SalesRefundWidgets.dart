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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Название товара:',
                    style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    'Яблоки',
                    style: TextStyle(fontSize: typography.bodyMedium?.fontSize),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Цена:',
                    style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    '10000' + ' тг',
                    style: TextStyle(fontSize: typography.bodyMedium?.fontSize),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Кол-во:',
                    style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    '10' + ' шт',
                    style: TextStyle(fontSize: typography.bodyMedium?.fontSize),
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

import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class SalesChequeWidgets extends StatelessWidget {
  final String productName;
  final String productPrice;
  const SalesChequeWidgets({
    Key? key,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 15),
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
                  Text('Название товара',
                      style: TextStyle(
                          fontWeight: typography.bodyMedium?.fontWeight)),
                  Text(
                    'Цена',
                    style: TextStyle(
                        fontWeight: typography.bodyMedium?.fontWeight),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(productName,
                      style: TextStyle(
                          fontWeight: typography.bodyMedium?.fontWeight)),
                  Text(
                    productPrice + ' тг',
                    style: TextStyle(
                        fontWeight: typography.bodyMedium?.fontWeight),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

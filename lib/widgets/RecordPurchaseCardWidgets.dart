import 'package:flutter/material.dart';
import 'package:salles_app/widgets/IconButtonDialogWidgets.dart';

import '../locale/AppLocalizations.dart';

class RecordPurchaseCardWidgets extends StatelessWidget {
  final String productName;
  final String productPrice;

  const RecordPurchaseCardWidgets({
    Key? key,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Название товара:',
                              style: TextStyle(
                                  fontSize: typography.bodyMedium?.fontSize,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              productName,
                              style: TextStyle(
                                  fontSize: typography.bodyMedium?.fontSize,
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.w700),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Цена:',
                              style: TextStyle(
                                  fontSize: typography.bodyMedium?.fontSize,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              productPrice + ' тг',
                              style: TextStyle(
                                  fontSize: typography.bodyMedium?.fontSize,
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.w700),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            IconButtonDialogWidgets(
                                idYes: 'idYes',
                                idNo: 'idNo',
                                idCompany: '',
                                alertTitle:
                                    'Вы уверены, что хотите удалить товар?',
                                icon: Icon(Icons.delete_outline,
                                    color: Colors.black87),
                                colorChoice: Colors.red.shade200)
                          ],
                        ),
                      ),
                    ],
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

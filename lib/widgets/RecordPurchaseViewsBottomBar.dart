import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../locale/AppLocalizations.dart';

class RecordPurchaseViewsBottomBar extends StatelessWidget {
  final Function(String) onBarcodeScanResult;
  final VoidCallback onPressed;
  const RecordPurchaseViewsBottomBar({
    Key? key,
    required this.onBarcodeScanResult,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Column(children: [
      Container(
        height: 40,
        width: double.infinity,
        child: FilledButton.tonal(
          onPressed: onPressed,
          child: Text(
            'Рассчитать',
            style: TextStyle(
                fontSize: typography.bodyMedium?.fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
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
      ),
      SizedBox(
        height: 5,
      ),
      Divider(),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 40,
        width: double.infinity,
        child: FilledButton.tonal(
          onPressed: () async {
            String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#ff6666',
              'Отмена',
              true,
              ScanMode.BARCODE,
            );

            // Вызываем функцию обратного вызова с результатом сканирования
            onBarcodeScanResult(barcodeScanRes);

            print('Результат сканирования: $barcodeScanRes');
          },
          child: Text(
            'Добавить товар',
            style: TextStyle(
                fontSize: typography.bodyMedium?.fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
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
    ]);
  }
}

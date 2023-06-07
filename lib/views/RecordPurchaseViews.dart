import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:salles_app/widgets/RecordPurchaseCardWidgets.dart';

import '../locale/AppLocalizations.dart';

class RecordPurchaseViews extends StatefulWidget {
  const RecordPurchaseViews({super.key});

  @override
  State<RecordPurchaseViews> createState() => _RecordPurchaseViewsState();
}

class _RecordPurchaseViewsState extends State<RecordPurchaseViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Назад',
          style: TextStyle(
              fontSize: typography.titleLarge?.fontSize,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 8),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Оформление покупки',
                style: TextStyle(
                    fontSize: typography.bodyMedium?.fontSize,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  RecordPurchaseCardWidgets(
                      productName: 'Томское Молоко', productPrice: '150'),
                  RecordPurchaseCardWidgets(
                      productName: 'Томское Молоко', productPrice: '150')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 45,
              width: double.infinity,
              child: FloatingActionButton.extended(
                onPressed: () async {
                  String barcodeScanRes =
                      await FlutterBarcodeScanner.scanBarcode(
                    '#ff6666', // Цвет кнопки сканирования
                    'Отмена', // Текст кнопки отмены
                    true, // Показывать ли стрелку навигации назад на iOS
                    ScanMode.BARCODE, // Режим сканирования (штрих-код)
                  );

                  // Здесь вы можете обрабатывать полученные результаты сканирования штрих-кода
                  print('Результат сканирования: $barcodeScanRes');
                },
                label: Text(
                  'Добавить товар',
                  style: TextStyle(
                      fontSize: typography.bodyMedium?.fontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

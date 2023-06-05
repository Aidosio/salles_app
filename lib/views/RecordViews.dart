import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class RecordViews extends StatefulWidget {
  const RecordViews({Key? key}) : super(key: key);

  @override
  State<RecordViews> createState() => _RecordViewsState();
}

class _RecordViewsState extends State<RecordViews> {
  String barcode = '';

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    String cameraScanResult = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Отмена',
      false,
      ScanMode.BARCODE,
    );

    setState(() {
      barcode = cameraScanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Назад', textAlign: TextAlign.left),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('RecordViews'),
          Text('Штрихкод: $barcode'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:salles_app/models/ProductIdsList.dart';
import 'package:salles_app/models/Products.dart';
import 'package:salles_app/models/ProductsList.dart';
import 'package:salles_app/service/ProductsListService.dart';
import 'package:salles_app/service/SalesService.dart';
import 'package:salles_app/widgets/RecordPurchaseCardWidgets.dart';

import '../locale/AppLocalizations.dart';
import '../models/Sales.dart';
import '../widgets/RecordPurchaseViewsBottomBar.dart';

class RecordPurchaseViews extends StatefulWidget {
  // Создаем переменную для хранения результата сканирования
  const RecordPurchaseViews({super.key});

  @override
  State<RecordPurchaseViews> createState() => _RecordPurchaseViewsState();
}

class _RecordPurchaseViewsState extends State<RecordPurchaseViews> {
  bool isLoading = false;
  List<dynamic>? _salesList;
  Sales? _sales;
  String? _salesId;
  String? _companyId;
  final List<Map<String, dynamic>> _productsList = [];

  // _getProductsById(String companyId, String productId, int quantity) async {
  //   try {
  //     Products? products =
  //         await ProductsListService().getProductsById(companyId, productId);
  //     if (products != null) {
  //       Map<String, dynamic> productMap = {
  //         "products": products.toJson(),
  //         "quantity": quantity,
  //       };
  //       _productsList.add(productMap);
  //       print(_productsList);
  //       isLoading = true;
  //     }
  //   } catch (e) {
  //     print('products $e');
  //   }
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
            <String, dynamic>{'companyId': '', 'salesId': ''})
        as Map<String, dynamic>;

    print(arguments["salesId"]);
    print(arguments["companyId"]);

    SalesService().getSales(arguments["salesId"]!).then((sales) {
      setState(() {
        _sales = sales;
        _salesList = _sales?.productIds;
      });

      if (_salesList != null) {
        for (int i = 0; i < _salesList!.length; i++) {
          var productIdsList = ProductIdsList.fromJson(_salesList![i]);
          print(productIdsList.productId);
          print(productIdsList.quantity);

          print(arguments["companyId"]);
          print(arguments["salesId"]);

          // _getProductsById(arguments["companyId"], productIdsList.productId,
          //     productIdsList.quantity);
        }
      }

      isLoading = true;
    }).catchError((error) {
      setState(() {
        isLoading = true;
      });
      print('Error getting sales: $error');
    });
  }

  void _handleBarcodeScanResult(String result) {
    setState(() {
      _barcodeScanResult =
          result; // Обновляем состояние с полученным результатом
    });
  }

  void _handleCalculatePressed() {
    Navigator.pushNamed(context, '/record-calulate');
  }

  String _barcodeScanResult = '';
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
                  // Text(_sales?.id ?? ''),
                  // Visibility(
                  //   visible: isLoading,
                  //   replacement: Center(
                  //     child: CircularProgressIndicator(),
                  //   ),
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     itemCount: _productsList.length,
                  //     itemBuilder: (context, index) {
                  //   return RecordPurchaseCardWidgets(
                  //       productName: 'Томское Молоко', productPrice: '150');
                  // },
                  //   ),
                  // ),
                  // RecordPurchaseCardWidgets(
                  //     productName: 'Томское Молоко', productPrice: '150'),
                  // Text(_barcodeScanResult)
                ],
              ),
            ),
            RecordPurchaseViewsBottomBar(
              onBarcodeScanResult: _handleBarcodeScanResult,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

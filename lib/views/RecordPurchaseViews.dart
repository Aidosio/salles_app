import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../models/Products.dart';
import 'package:salles_app/service/ProductsListService.dart';

import '../models/Sales.dart';
import '../service/SalesService.dart';
import '../widgets/RecordPurchaseCardWidgets.dart';
import '../widgets/RecordPurchaseViewsBottomBar.dart';

class RecordPurchaseViews extends StatefulWidget {
  final String arguments;

  const RecordPurchaseViews({Key? key, required this.arguments})
      : super(key: key);

  @override
  State<RecordPurchaseViews> createState() => _RecordPurchaseViewsState();
}

class _RecordPurchaseViewsState extends State<RecordPurchaseViews> {
  bool isLoading = false;
  String _barcodeScanResult = '';
  List<Map<String, dynamic>> _productsList = [];
  Sales? _sales;

  getBarcodeProduct(String barcode) async {
    try {
      Products? products =
          await ProductsListService().getProductsByBarcode(barcode);
      if (products != null) {
        addProductToList(products);
      }
      addProductsSales(widget.arguments, products!.id);
    } catch (e) {
      print('Error getting product: $e');
    }
  }

  addProductToList(Products product) {
    setState(() {
      Map<String, dynamic> productMap = {
        "product": product,
      };
      _productsList.add(productMap);
      isLoading = true;
    });
    print(_productsList);
  }

  addProductsSales(String salesId, String productId) async {
    try {
      Sales? sales = await SalesService().addProdutsSales(salesId, productId);
    } catch (e) {
      print('addProdutsSales $e');
    }
  }

  removeProdutsSales(String salesId, String productId) async {
    try {
      await SalesService().removeProdutsSales(salesId, productId);
      setState(() {
        _productsList
            .removeWhere((productMap) => productMap['product'].id == productId);
      });
    } catch (e) {
      print('removeProdutsSales $e');
    }
  }

  void _handleBarcodeScanResult(String result) {
    setState(() {
      _barcodeScanResult = result;
    });
    getBarcodeProduct(_barcodeScanResult.toString());
    print(_barcodeScanResult);
  }

  _getProductsById(String productId, int quantity) async {
    try {
      Products? products =
          await ProductsListService().getProductsById(productId);
      if (products != null) {
        Map<String, dynamic> productMap = {
          "product": products,
          "quantity": quantity,
        };
        setState(() {
          _productsList.add(productMap);
          isLoading = true;
        });
        print(_productsList);
      }
    } catch (e) {
      print('products $e');
    }
  }

  getSales(String id) async {
    try {
      Sales? sales = await SalesService().getSales(id);
      List<dynamic> productIds = sales!.productIds;

      for (int i = 0; i < productIds.length; i++) {
        String productId = productIds[i]['productId'];
        int quantity = productIds[i]['quantity'];

        _getProductsById(productId, quantity);
      }

      setState(() {
        _sales = sales;
      });

      isLoading = true;
    } catch (e) {
      print('Sales $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getSales(widget.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 8),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Visibility(
                      visible: isLoading,
                      replacement: Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: _productsList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _productsList.length,
                              itemBuilder: (context, index) {
                                final productMap = _productsList[index]
                                    as Map<String, dynamic>;
                                final product =
                                    productMap["product"] as Products;
                                return RecordPurchaseCardWidgets(
                                  productName: product.name,
                                  productPrice: product.price.toString(),
                                  onPressed: () => removeProdutsSales(
                                      widget.arguments, product.id),
                                );
                              },
                            )
                          : Text('No products available')),
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

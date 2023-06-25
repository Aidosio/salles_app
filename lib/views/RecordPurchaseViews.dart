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
  List<Products> _productsList = [];
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
      _productsList.add(product);
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
        _productsList.removeWhere((product) => product.id == productId);
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

  _getProductsById(String productId) async {
    try {
      Products? products =
          await ProductsListService().getProductsById(productId);
      if (products != null) {
        setState(() {
          _productsList.add(products);
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

        _getProductsById(productId);
      }

      setState(() {
        _sales = sales;
      });

      isLoading = true;
    } catch (e) {
      print('Sales $e');
    }
  }

  setStatus(String id) async {
    try {
      await SalesService().salesStatud(id);
    } catch (e) {
      print('object status $e');
    }
  }

  calcTotalPrice(String id) async {
    try {
      String? totalPrice = await SalesService().calculateTotalPrice(id);
      setStatus(id);
      Navigator.pushNamed(context, '/record-calculate', arguments: totalPrice);
    } catch (e) {
      print('object total $e');
    }
  }

  // () {
  //           Navigator.pushNamed(context, '/record-calculate');
  //         },

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
                              final product = _productsList[index];
                              return RecordPurchaseCardWidgets(
                                productName: product.name,
                                productPrice: product.price.toString(),
                                onPressed: () => removeProdutsSales(
                                  widget.arguments,
                                  product.id,
                                ),
                              );
                            },
                          )
                        : Text('No products available'),
                  ),
                ],
              ),
            ),
            RecordPurchaseViewsBottomBar(
              onBarcodeScanResult: _handleBarcodeScanResult,
              onPressed: () => calcTotalPrice(widget.arguments),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

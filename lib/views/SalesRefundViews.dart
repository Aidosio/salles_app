import 'package:flutter/material.dart';
import 'package:salles_app/models/ProductIdsList.dart';
import 'package:salles_app/models/Sales.dart';
import 'package:salles_app/models/SalesList.dart';
import 'package:salles_app/service/SalesService.dart';
import 'package:salles_app/widgets/MyBarWidget.dart';
import '../locale/AppLocalizations.dart';
import '../models/Products.dart';
import '../service/ProductsListService.dart';
import '../widgets/SalesRefundWidgets.dart';

class SalesRefundViews extends StatefulWidget {
  const SalesRefundViews({Key? key}) : super(key: key);

  @override
  State<SalesRefundViews> createState() => _SalesRefundViewsState();
}

class _SalesRefundViewsState extends State<SalesRefundViews> {
  Sales? _sales;
  List<ProductIdsList>? _salesList;
  List<ProductIdsList>? _returnProductsList;
  bool isLoading = false;
  final List<Map<String, dynamic>> _productsList = [];
  final List<Map<String, dynamic>> _returnProductsLists = [];

  _getProductsById(String productId, int quantity) async {
    try {
      Products? products =
          await ProductsListService().getProductsById(productId);
      if (products != null) {
        Map<String, dynamic> productMap = {
          "products": products.toJson(),
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

  _getReturnProductsById(String productId, int quantity) async {
    try {
      Products? products =
          await ProductsListService().getProductsById(productId);
      if (products != null) {
        Map<String, dynamic> productMap = {
          "products": products.toJson(),
          "quantity": quantity,
        };
        setState(() {
          _returnProductsLists.add(productMap);
          isLoading = true;
        });
        print(_returnProductsLists);
      }
    } catch (e) {
      print('products $e');
    }
  }

  getSales(String id) async {
    try {
      Sales? sales = await SalesService().getSales(id);
      List<dynamic> productIds = sales!.productIds;
      List<dynamic> productReturnIds = sales.returnProducts;

      List<ProductIdsList> parsedSalesList =
          productIds.map((json) => ProductIdsList.fromJson(json)).toList();

      List<ProductIdsList> _returnParsedSalesList = productReturnIds
          .map((json) => ProductIdsList.fromJson(json))
          .toList();

      for (int i = 0; i < parsedSalesList.length; i++) {
        print(parsedSalesList[i].productId);
        print(parsedSalesList[i].quantity);

        _getProductsById(
            parsedSalesList[i].productId, parsedSalesList[i].quantity);
      }

      for (int i = 0; i < _returnParsedSalesList.length; i++) {
        print(_returnParsedSalesList[i].productId);
        print(_returnParsedSalesList[i].quantity);

        _getReturnProductsById(_returnParsedSalesList[i].productId,
            _returnParsedSalesList[i].quantity);
      }
      setState(() {
        _sales = sales;
        _salesList = parsedSalesList;
        _returnProductsList =
            _returnParsedSalesList; // Assigning to returnProductsList
      });

      isLoading = true;
    } catch (e) {
      print('Sales $e');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments =
        (ModalRoute.of(context)?.settings.arguments ?? '') as String;

    print(arguments);
    getSales(arguments);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(''),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    Visibility(
                      visible: isLoading,
                      replacement: Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _productsList.length,
                        itemBuilder: (context, index) {
                          final productMap =
                              _productsList[index] as Map<String, dynamic>;
                          final product =
                              Products.fromJson(productMap["products"]);
                          final quantity = productMap["quantity"] as int;
                          if (_productsList.isNotEmpty) {
                            if (quantity > 0) {
                              return SalesRefundWidgets(
                                name: product.name,
                                price: product.price.toString(),
                              );
                            }
                          } else {
                            return Container(
                              child: Text('data'),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),

                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Возврат',
                            style: TextStyle(
                                fontSize: typography.bodyMedium?.fontSize,
                                fontWeight: FontWeight.w600),
                          ),
                          Divider(),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isLoading,
                      replacement: Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _returnProductsLists.length,
                        itemBuilder: (context, index) {
                          final productMap = _returnProductsLists[index]
                              as Map<String, dynamic>;
                          final product =
                              Products.fromJson(productMap["products"]);
                          if (_returnProductsLists.isNotEmpty) {
                            return SalesRefundWidgets(
                              name: product.name,
                              price: product.price.toString(),
                            );
                          } else {
                            return Container(
                              child: Text('data'),
                            );
                          }
                        },
                      ),
                    ),

                    // SalesRefundWidgets(),
                    // SalesRefundWidgets(),
                    // SalesRefundWidgets(),
                    // SalesRefundWidgets(),
                    // SalesRefundWidgets(),
                  ],
                ),
              ),
            ),
          ),
          MyBarWidget(
              totalPrice:
                  _sales != null ? _sales!.price.toString() : 'загрузка...',
              buttonTitle: 'Возврат',
              id: _sales != null ? _sales!.id : '1',
              popBack: true,
              routeWay: '/sales-refund-accept',
              totalRefund: '0',
              isVisible: true),
        ],
      ),
    );
  }
}

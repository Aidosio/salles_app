import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';
import '../models/ProductIdsList.dart';
import '../models/Products.dart';
import '../models/Sales.dart';
import '../service/ProductsListService.dart';
import '../service/SalesService.dart';
import '../widgets/MyBarWidget.dart';
import '../widgets/SalesRefundAcceptionCardWidgets.dart';

class SalesRefundAcceptionViews extends StatefulWidget {
  const SalesRefundAcceptionViews({Key? key}) : super(key: key);

  @override
  State<SalesRefundAcceptionViews> createState() =>
      _SalesRefundAcceptionViewsState();
}

class _SalesRefundAcceptionViewsState extends State<SalesRefundAcceptionViews> {
  Sales? _sales;
  List<ProductIdsList>? _salesList;
  bool isLoading = false;
  final List<Map<String, dynamic>> _productsList = [];

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
      isLoading = false;
    } catch (e) {
      print('products $e');
    }
  }

  getSales(String id) async {
    try {
      setState(() {
        isLoading = true;
      });

      Sales? sales = await SalesService().getSales(id);
      List<dynamic> productIds = sales!.productIds;

      List<ProductIdsList> parsedSalesList =
          productIds.map((json) => ProductIdsList.fromJson(json)).toList();

      for (int i = 0; i < parsedSalesList.length; i++) {
        print(parsedSalesList[i].productId);
        print(parsedSalesList[i].quantity);

        _getProductsById(
            parsedSalesList[i].productId, parsedSalesList[i].quantity);
      }

      setState(() {
        _sales = sales;
        _salesList = parsedSalesList;
        isLoading = false; // Установка isLoading в false после получения данных
      });
    } catch (e) {
      print('Sales $e');
      setState(() {
        isLoading = false; // Установка isLoading в false в случае ошибки
      });
    }
  }

  returnProdutsSales(String salesId, String productId) async {
    try {
      setState(() {
        isLoading = true; // Установка isLoading в true перед запросом
        _productsList.clear(); // Очистка массива _productsList
      });

      Sales? sales =
          await SalesService().returnProdutsSales(salesId, productId);
      List<dynamic> productIds = sales!.productIds;

      List<ProductIdsList> parsedSalesList =
          productIds.map((json) => ProductIdsList.fromJson(json)).toList();

      for (int i = 0; i < parsedSalesList.length; i++) {
        print(parsedSalesList[i].productId);
        print(parsedSalesList[i].quantity);

        _getProductsById(
            parsedSalesList[i].productId, parsedSalesList[i].quantity);
      }

      setState(() {
        _sales = sales;
        _salesList = parsedSalesList;
      });

      isLoading = false; // Установка isLoading в false после завершения запроса
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
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    if (isLoading)
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    else
                      ListView.builder(
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
                              return SalesRefundAcceptionCardWidgets(
                                name: product.name,
                                price: product.price.toString(),
                                onPressed: () {
                                  returnProdutsSales(
                                      _sales!.id,
                                      product
                                          .id); // Вызовите вашу функцию здесь
                                },
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
                  ],
                ),
              ),
            ),
          ),
          MyBarWidget(
              totalPrice:
                  _sales != null ? _sales!.price.toString() : 'загрузка...',
              buttonTitle: 'Закончить',
              id: _sales != null ? _sales!.id : '1',
              popBack: false,
              routeWay: null,
              totalRefund: '5000',
              isVisible: false),
        ],
      ),
    );
  }
}

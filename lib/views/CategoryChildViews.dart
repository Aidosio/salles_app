import 'package:flutter/material.dart';
import 'package:salles_app/models/Company.dart';
import 'package:salles_app/models/ProductsList.dart';
import 'package:salles_app/models/Users.dart';
import 'package:salles_app/service/Auth.dart';
import 'package:salles_app/service/CompanyService.dart';
import 'package:salles_app/service/ProductsListService.dart';
import 'package:salles_app/widgets/CategoryChildCardWidgets.dart';
import 'package:salles_app/widgets/SwipeRefresh.dart';

import '../locale/AppLocalizations.dart';

class CategoryChildViews extends StatefulWidget {
  const CategoryChildViews({Key? key}) : super(key: key);

  @override
  State<CategoryChildViews> createState() => _CategoryChildViewsState();
}

class _CategoryChildViewsState extends State<CategoryChildViews> {
  List<ProductsList>? _productsList;
  bool isLoaded = false;

  late String categoryName;
  late String companyId;

  _getAllCategory() async {
    try {
      List<ProductsList>? productsList = await ProductsListService()
          .getAllProductsByCategoryId(companyId, categoryName);
      setState(() {
        _productsList = productsList;
      });
      print('object');
      isLoaded = true;
    } catch (e) {
      print('Error getting products by ID: $e');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    categoryName = arguments?['categoryName'] ?? 'Не найдено';
    companyId = arguments?['companyId'] ?? 'Не найдено';

    _getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          categoryName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: typography.headline6?.fontSize,
          ),
        ),
      ),
      body: SwipeRefresh(
        onRefresh: () async {
          try {
            List<ProductsList>? productsList = await ProductsListService()
                .getAllProductsByCategoryId(companyId, categoryName);
            setState(() {
              _productsList = productsList;
            });
            print('object');
            isLoaded = true;
          } catch (e) {
            print('Error getting products by ID: $e');
          }
        },
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 8),
          child: Column(
            children: [
              isLoaded
                  ? _productsList == null || _productsList!.isEmpty
                      ? Align(
                          child:
                              Text('У вас пока нету товаров в этой категорий'),
                        ) // Надпись "Data" при отсутствии товаров
                      : Expanded(
                          // Оберните ListView в Expanded
                          child: ListView.builder(
                            itemCount: _productsList!.length,
                            itemBuilder: ((context, index) {
                              return CategoryChildCardWidgets(
                                titleName: _productsList![index].name,
                                cost: _productsList![index].price.toString(),
                                quantity:
                                    _productsList![index].count.toString(),
                                barcode: _productsList![index].barcode,
                                categoryName: categoryName,
                                id: _productsList![index].id,
                              );
                            }),
                          ),
                        )
                  : Visibility(
                      visible: isLoaded,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child:
                          CircularProgressIndicator(), // Показывать индикатор загрузки при загрузке данных
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

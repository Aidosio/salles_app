import 'package:flutter/material.dart';
import 'package:salles_app/models/CategoryList.dart';
import 'package:salles_app/models/Company.dart';
import 'package:salles_app/service/Auth.dart';
import 'package:salles_app/service/CategoryService.dart';
import 'package:salles_app/service/CompanyService.dart';
import 'package:salles_app/widgets/CategoryCardWidgets.dart';
import 'package:salles_app/widgets/SwipeRefresh.dart';

import '../locale/AppLocalizations.dart';
import 'CategoryChildViews.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'ProductViews.dart';

class CategoryViews extends StatefulWidget {
  const CategoryViews({super.key});

  @override
  State<CategoryViews> createState() => _CategoryViewsState();
}

class _CategoryViewsState extends State<CategoryViews> {
  Future<void> _scanBarcode() async {
    try {
      String result = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Цвет верхней панели сканера
        'Отмена', // Текст кнопки отмены
        true, // Использовать кнопку спуска затвора
        ScanMode.BARCODE, // Режим сканирования (штрих-коды)
      );
      if (result != '-1') {
        Navigator.pushNamed(context, '/product', arguments: result);
      }
    } catch (e) {
      // Обработка исключения
      print('Ошибка сканирования штрих-кода: $e');
      // Дополнительный код для обработки ошибки
    }
  }

  List<CategoryList>? _categoryList;
  bool isLoaded = false;
  String _ids = '';
  Company? _company;

  _getCategoryList() async {
    try {
      List<CategoryList>? categoryList =
          await CategoryService().getAllCategory();
      setState(() {
        _categoryList = categoryList;
      });
      isLoaded = true;
      print(_categoryList);
    } catch (e) {
      // Обработка исключения
      print('Ошибка при получении списка категорий: $e');
      // Дополнительный код для обработки ошибки
    }
  }

  void getIdUser() async {
    String? userId = await Auth.getUserId();
    if (userId != null) {
      setState(() {
        _ids = userId;
      });
      print('User ID: $userId');
      if (await Auth.checkRole('OWNER')) {
        _getCompanyByOwnerId(_ids);
      } else {
        _getCompanyBySallerId(_ids);
      }
    } else {
      print('User is not authenticated');
    }
  }

  _getCompanyByOwnerId(String id) async {
    try {
      Company? company = await CompanyService().getCompanyByOwnerId(id);
      setState(() {
        _company = company;
      });
      print(_company);
      isLoaded = true;
    } catch (e) {
      print('Error getting company by ID: $e');
    }
  }

  _getCompanyBySallerId(String id) async {
    try {
      Company? company = await CompanyService().getCompanyBySallerId(id);
      setState(() {
        _company = company;
      });
      print(_company);
      isLoaded = true;
    } catch (e) {
      print('Error getting company by ID: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getIdUser();
    _getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SwipeRefresh(
        onRefresh: () async {
          try {
            List<CategoryList>? categoryList =
                await CategoryService().getAllCategory();
            setState(() {
              _categoryList = categoryList;
            });
            isLoaded = true;
            print(_categoryList);
          } catch (e) {
            // Обработка исключения
            print('Ошибка при получении списка категорий: $e');
            // Дополнительный код для обработки ошибки
          }
        },
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 8),
          child: Column(
            children: [
              SizedBox(height: 10),
              Visibility(
                visible: isLoaded,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: Expanded(
                  child: ListView.builder(
                    itemCount: _categoryList?.length,
                    itemBuilder: ((context, index) {
                      return CategoryCardWidgets(
                        categoryName: _categoryList![index].name,
                        companyId: _company != null ? _company!.id : 'null',
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 50.0,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: FloatingActionButton.extended(
          onPressed: () {
            _scanBarcode();
          },
          elevation: 0,
          label: Text(
            'Добавить товар',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          icon: Icon(Icons.add),
          tooltip: "Добавить новый товар",
          extendedTextStyle: TextStyle(
              fontSize: typography.bodyMedium?.fontSize,
              fontWeight: FontWeight.w400),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}

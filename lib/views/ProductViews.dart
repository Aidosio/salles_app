import 'package:flutter/material.dart';
import 'package:salles_app/models/CategoryList.dart';
import 'package:salles_app/models/Company.dart';
import 'package:salles_app/service/Auth.dart';
import 'package:salles_app/service/CategoryService.dart';
import 'package:salles_app/service/CompanyService.dart';
import 'package:salles_app/service/ProductsListService.dart';
import 'package:salles_app/widgets/BlockedRefreshWidgets.dart';

import '../locale/AppLocalizations.dart';
import '../widgets/ProductTextFieldViews.dart';

class ProductViews extends StatefulWidget {
  const ProductViews({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductViews> createState() => _ProductViewsState();
}

class _ProductViewsState extends State<ProductViews> {
  CategoryList? selectedCategory;

  List<CategoryList> category = [];

  List<CategoryList>? _categoryList;
  bool isLoaded = false;
  bool isLoading = false;
  String _ids = '';
  Company? _company;
  String productName = '';
  double productPrice = 0.0;
  int productCount = 0;

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
      print(_company?.id);
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
      print(_company?.id);
      isLoaded = true;
    } catch (e) {
      print('Error getting company by ID: $e');
    }
  }

  _createProduct(String companyId, String categoryId, String name, double price,
      String barcode, int count) async {
    try {
      ProductsListService()
          .createProduct(companyId, categoryId, name, price, barcode, count);
      Navigator.pop(context);
      isLoading = true;
    } catch (e) {
      print('Error create products: $e');
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
    final barcode = ModalRoute.of(context)?.settings.arguments as String?;
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.backWards ?? '',
            // 'Назад',
            textAlign: TextAlign.left),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 8),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ProductTextFieldViews(
                        isEnabled: true,
                        isPhone: false,
                        hintTextExample: localizations?.productName ?? '',
                        // 'Название товара',
                        labelTextExample: localizations?.productName ?? '',
                        // 'Название товара',
                        initialValue: '',
                        onChanged: (value) {
                          setState(() {
                            productName = value;
                          });
                        },
                      ),
                      ProductTextFieldViews(
                        isEnabled: true,
                        isPhone: true,
                        hintTextExample: '1000 тг',
                        labelTextExample: localizations?.productPrice ?? '',
                        // 'Цена товара',
                        initialValue: '',
                        onChanged: (value) {
                          setState(() {
                            productPrice = double.tryParse(value) ?? 0.0;
                          });
                        },
                      ),
                      ProductTextFieldViews(
                        isEnabled: true,
                        isPhone: true,
                        hintTextExample: '100 ${localizations?.pieces ?? ''}',
                        labelTextExample: localizations?.quantityGoods ?? '',
                        // 'Количество',
                        initialValue: '',
                        onChanged: (value) {
                          setState(() {
                            productCount = int.tryParse(value) ?? 0;
                          });
                        },
                      ),
                      DropdownButtonFormField<CategoryList>(
                        value: selectedCategory,
                        onChanged: (CategoryList? newValue) {
                          setState(() {
                            selectedCategory = newValue;
                          });
                          print(selectedCategory!.id);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: localizations?.productCategory ?? '',
                          // 'Категория товара',
                        ),
                        items:
                            _categoryList?.map<DropdownMenuItem<CategoryList>>(
                          (CategoryList value) {
                            return DropdownMenuItem<CategoryList>(
                              value: value,
                              child: Text(value.name),
                            );
                          },
                        ).toList(),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        enabled: false,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: barcode,
                          labelText: '$barcode',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  height: 45,
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      _createProduct(_company!.id, selectedCategory!.id,
                          productName, productPrice, barcode!, productCount);

                      print(
                          '${_company!.id}, ${selectedCategory!.id}, ${productName}, ${productPrice}, ${barcode!}, $productCount');
                    },
                    child: Text(
                      localizations?.add ?? '',
                      // 'Добавить',
                      style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.lightBlueAccent),
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
              ],
            ),
          ),
          BlockedRefreshWidgets(
            isVisible: isLoading,
          ),
        ],
      ),
    );
  }
}

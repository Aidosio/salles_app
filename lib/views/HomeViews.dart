import 'package:flutter/material.dart';
import 'package:salles_app/locale/AppLocalizations.dart';
import 'package:salles_app/widgets/CategoryChildCardWidgets.dart';
import 'package:salles_app/widgets/SalesHistoryWidget.dart';
import 'package:salles_app/widgets/SwipeRefresh.dart';

import '../models/Company.dart';
import '../models/ProductsList.dart';
import '../models/Users.dart';
import '../service/Auth.dart';
import '../service/CompanyService.dart';
import '../service/ProductsListService.dart';
import '../service/User.dart';

class HomeViews extends StatefulWidget {
  final String id;
  const HomeViews({Key? key, required this.id}) : super(key: key);

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  bool isTrue = false;
  bool isLoaded = false;
  String _ids = '';
  Users? _user;
  Company? _company;
  List<ProductsList>? _productsList;

  void getIdUser() async {
    String? userId = await Auth.getUserId();
    if (userId != null) {
      setState(() {
        _ids = userId;
      });
      print('User ID: $userId');
      _userById(_ids);
      if (await Auth.checkRole('OWNER')) {
        _getCompanyByOwnerId(_ids);
      } else {
        _getCompanyBySellerId(_ids);
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
      _getLastProducts(_company?.id);
    } catch (e) {
      print('Error getting company by ID: $e');
    }
  }

  _getCompanyBySellerId(String id) async {
    try {
      Company? company = await CompanyService().getCompanyBySallerId(id);
      setState(() {
        _company = company;
      });
      print(_company);
      _getLastProducts(_company?.id);
    } catch (e) {
      print('Error getting company by ID: $e');
    }
  }

  _userById(id) async {
    Users? user = await User().userById(id);
    setState(() {
      _user = user;
    });
  }

  _getLastProducts(companyId) async {
    try {
      List<ProductsList>? productsList =
          await ProductsListService().getLastProducts(companyId);
      setState(() {
        _productsList = productsList;
      });
      isLoaded = true;
      print(_productsList);
    } catch (e) {
      print('Error getting last products: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getIdUser();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return SwipeRefresh(
      onRefresh: () async {
        _getLastProducts(_company!.id);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 8),
            child: Column(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Последние продажи',
                        style: TextStyle(
                            fontSize: typography.bodyMedium?.fontSize,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 5),
                    Divider(
                      height: 1,
                      thickness: 2,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 15),
                    if (isTrue)
                      SalesHistoryWidget(checkNum: '4564644', price: '4500')
                    else
                      Text(
                        'У вас пока нету продаж',
                        style: TextStyle(
                            fontSize: typography.bodyLarge?.fontSize,
                            fontWeight: FontWeight.w500),
                      ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Последние добавленные товары',
                        style: TextStyle(
                            fontSize: typography.bodyMedium?.fontSize,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 5),
                    Divider(
                      height: 1,
                      thickness: 2,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    SizedBox(height: 15),
                  ],
                ),
                SingleChildScrollView(
                  physics: ScrollPhysics(), // Добавлено для прокрутки
                  child: Column(
                    children: [
                      Visibility(
                        visible: isLoaded,
                        replacement: Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics:
                              NeverScrollableScrollPhysics(), // Отключена прокрутка ListView
                          itemCount: _productsList?.length,
                          itemBuilder: (context, index) {
                            if (!_productsList!.isEmpty) {
                              return CategoryChildCardWidgets(
                                titleName: _productsList![index].name,
                                cost: _productsList![index].price.toString(),
                                quantity:
                                    _productsList![index].count.toString(),
                                barcode: _productsList![index].barcode,
                                categoryName:
                                    _productsList![index].category.name,
                                id: _productsList![index].id,
                              );
                            } else {
                              return Container(
                                child: Text('data'),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

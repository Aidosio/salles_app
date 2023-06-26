import 'package:flutter/material.dart';
import 'package:salles_app/models/SalesList.dart';
import 'package:salles_app/service/SalesService.dart';
import 'package:salles_app/widgets/RecordSalesCardWidgets.dart';

import '../locale/AppLocalizations.dart';
import '../models/Company.dart';
import '../models/Sales.dart';
import '../models/Users.dart';
import '../service/Auth.dart';
import '../service/CompanyService.dart';
import '../service/User.dart';
import '../widgets/SwipeRefresh.dart';
import 'RecordPurchaseViews.dart';

class RecordViews extends StatefulWidget {
  const RecordViews({Key? key}) : super(key: key);

  @override
  State<RecordViews> createState() => _RecordViewsState();
}

class _RecordViewsState extends State<RecordViews> {
  bool isLoaded = false;
  String _ids = '';
  Users? _user;
  Company? _company;
  List<SalesList>? _salesList;
  List<SalesList>? _filteredSalesList;
  Sales? _sales;

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
      _getAllSales(company!.id);
      print(_company);
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
      _getAllSales(company!.id);
      print(_company);
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

  _getAllSales(id) async {
    try {
      List<SalesList>? salesList = await SalesService().getAllSales(id);
      setState(() {
        _salesList = salesList;
        _filteredSalesList = salesList != null ? List.from(salesList) : [];
        isLoaded = true; // Обновите значение переменной isLoaded
      });
      print(_filteredSalesList);
    } catch (e) {
      print('Error getting sales by ID: $e');
    }
  }

  _createSales(id) async {
    try {
      Sales? sales = await SalesService().createSales(id);
      if (sales != null) {
        setState(() {
          _sales = sales;
          _filteredSalesList?.add(SalesList(
            id: sales.id,
            createDate: sales.createDate,
            status: sales.status,
            productIds: sales.productIds ?? [], // Ensure productIds is not null
            returnProducts:
                sales.returnProducts ?? [], // Ensure returnProducts is not null
          ));
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecordPurchaseViews(arguments: sales.id),
          ),
        );
      } else {
        print('Error creating sales: returned object is null');
      }
    } catch (e) {
      print('Error creating sales: $e');
    }
  }

  _deleteSales(String id) async {
    try {
      await SalesService().deleteSales(id);
      setState(() {
        _filteredSalesList?.removeWhere((sales) => sales.id == id);
      });
    } catch (e) {
      print('object');
    }
  }

  Future<void> _refreshSalesList() async {
    try {
      List<SalesList>? salesList =
          await SalesService().getAllSales(_company!.id);
      setState(() {
        _salesList = salesList;
        _filteredSalesList = salesList != null ? List.from(salesList) : null;
      });
      isLoaded = true;
    } catch (e) {
      print('Error getting sales by ID: $e');
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SwipeRefresh(
        onRefresh: () async {
          try {
            List<SalesList>? salesList =
                await SalesService().getAllSales(_company!.id);
            setState(() {
              _salesList = salesList;
              _filteredSalesList =
                  salesList != null ? List.from(salesList) : null;
            });
            isLoaded = true;
          } catch (e) {
            print('Error getting sales by ID: $e');
          }
        },
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 8),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      Visibility(
                        visible: isLoaded,
                        replacement: Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: _filteredSalesList != null &&
                                _filteredSalesList!.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _filteredSalesList!.length,
                                itemBuilder: (context, index) {
                                  if (!_filteredSalesList![index].status) {
                                    return RecordSalesCardWidgets(
                                      idYes: _filteredSalesList![index].id,
                                      idNo: 'no',
                                      salesId: _filteredSalesList![index].id,
                                      id: _filteredSalesList![index].id,
                                      onPressed: () => _deleteSales(
                                          _filteredSalesList![index].id),
                                    );
                                  } else if (index ==
                                      _filteredSalesList!.length - 1) {
                                    // Последний элемент и все предыдущие имеют status == true
                                    return Container(
                                      alignment: Alignment.center,
                                      child: Text('У вас нету активных продаж'),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              )
                            : Container(
                                alignment: Alignment.center,
                                child: Text('У вас нету активных продаж'),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 45,
                width: double.infinity,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    _createSales(_company!.id);
                  },
                  label: Text(
                    localizations?.makeASale ?? '',
                    style: TextStyle(
                      fontSize: typography.bodyMedium?.fontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

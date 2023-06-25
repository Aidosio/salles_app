import 'package:flutter/material.dart';
import 'package:salles_app/widgets/SalesHistoryWidget.dart';

import '../locale/AppLocalizations.dart';
import '../models/Company.dart';
import '../models/Sales.dart';
import '../models/SalesList.dart';
import '../models/Users.dart';
import '../service/Auth.dart';
import '../service/CompanyService.dart';
import '../service/SalesService.dart';
import '../service/User.dart';

class SalesViews extends StatefulWidget {
  const SalesViews({Key? key}) : super(key: key);

  @override
  State<SalesViews> createState() => _SalesViewsState();
}

class _SalesViewsState extends State<SalesViews> {
  bool isLoaded = false;
  String _ids = '';
  Users? _user;
  Company? _company;
  List<SalesList>? _salesList;
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
      // _salesList = _company!.purchases as SalesList?;
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
      // _salesList = _company!.purchases.cast<SalesList>() as SalesList?;
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

    bool _isOpened = true;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              ExpansionTile(
                initiallyExpanded: _isOpened,
                key: Key('firstExpansionTile'),
                title: Text('Продажи'),
                trailing: Icon(Icons.arrow_drop_down_rounded),
                children: [
                  Column(
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
                          itemCount: _salesList?.length,
                          itemBuilder: (context, index) {
                            if (!_salesList!.isEmpty) {
                              if (_salesList![index].status) {
                                return SalesHistoryWidget(
                                  checkNum: _salesList![index].id,
                                  price: _salesList![index].price.toString(),
                                );
                              } else {
                                return Container();
                              }
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

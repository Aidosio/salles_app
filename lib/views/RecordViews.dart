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

class RecordViews extends StatefulWidget {
  const RecordViews({super.key});

  @override
  State<RecordViews> createState() => _RecordViewsState();
}

class _RecordViewsState extends State<RecordViews> {
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

  _createSales(id) async {
    try {
      Sales? sales = await SalesService().createSales(id);
      setState(() {
        _sales = sales;
      });
      Navigator.pushNamed(context, '/record-purchase',
          arguments: {"salesId": sales!.id, "companyId": _company!.id});
    } catch (e) {
      print('create sales $e');
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
                child: Column(
                  children: [
                    Visibility(
                      visible: isLoaded,
                      replacement: Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _salesList?.length,
                        itemBuilder: (context, index) {
                          if (!_salesList!.isEmpty) {
                            if (!_salesList![index].status) {
                              return RecordSalesCardWidgets(
                                idYes: _salesList![index].id,
                                idNo: 'no',
                                salesId: _salesList![index].id,
                                id: _company!.id,
                              );
                            }
                          } else {
                            return Container(
                              child: Text('data'),
                            );
                          }
                        },
                      ),
                    ),

                    // RecordSalesCardWidgets(
                    //   idYes: 'yes',
                    //   idNo: 'no',
                    //   salesId: '55465464989842132132165464789',
                    //   id: '1',
                    // ),
                    // RecordSalesCardWidgets(
                    //   idYes: 'yes',
                    //   idNo: 'no',
                    //   salesId: '5522222222222222266666666664',
                    //   id: '2',
                    // ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 45,
                width: double.infinity,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    _createSales(_company!.id);
                    // print('next');
                    // Navigator.pushNamed(context, '/');
                  },
                  label: Text(
                    'Оформить продажу',
                    style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
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

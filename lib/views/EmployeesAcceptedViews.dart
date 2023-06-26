import 'package:flutter/material.dart';
import 'package:salles_app/service/User.dart';
import 'package:salles_app/widgets/EmployeesAcceptedWidget.dart';

import '../locale/AppLocalizations.dart';
import '../models/Company.dart';
import '../service/Auth.dart';
import '../service/CompanyService.dart';

class EmployeesAcceptedViews extends StatefulWidget {
  final String id;

  const EmployeesAcceptedViews({Key? key, required this.id}) : super(key: key);

  @override
  State<EmployeesAcceptedViews> createState() => _EmployeesAcceptedViewsState();
}

class _EmployeesAcceptedViewsState extends State<EmployeesAcceptedViews> {
  Company? _company;
  bool isLoaded = false;
  List<dynamic> _activeSellers = [];

  getRole() async {
    bool role = await Auth.checkRole('OWNER');
    setState(() {
      roles = role;
    });
  }

  bool? roles;

  _getCompanyByOwnerId(String id) async {
    try {
      Company? company = await CompanyService().getCompanyByOwnerId(id);
      setState(() {
        _company = company;
        _filterActiveSellers();
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
        _filterActiveSellers();
      });
      print(_company);
      isLoaded = true;
    } catch (e) {
      print('Error getting company by ID: $e');
    }
  }

  _getCompany() async {
    if (await Auth.checkRole('OWNER')) {
      _getCompanyByOwnerId(widget.id);
    } else {
      _getCompanyBySallerId(widget.id);
    }
  }

  void _filterActiveSellers() {
    _activeSellers =
        _company?.sellers.where((seller) => seller.enabled == true).toList() ??
            [];
  }

  // _deleteUser(String company, String id) async {
  //     try {
  //       await CompanyService().deleteByCompanySaller(company, id);
  //       isLoaded = true;
  //       if (isLoaded) {
  //         Navigator.pop(context);
  //       }
  //       print('yes delete');
  //     } catch (e) {
  //       print('Error getting company by ID: $e');
  //     }
  //   }

  _deleteUser(String company, String id) async {
    try {
      int? statusCode =
          await CompanyService().deleteByCompanySaller(company, id);
      if (statusCode == 204) {
        setState(() {
          _activeSellers.removeWhere((seller) => seller.id == id);
        });
      }
    } catch (e) {
      print('Error deleting user: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getRole();
    _getCompany();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 8),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Visibility(
              visible: isLoaded,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _activeSellers.length,
                    itemBuilder: (context, index) {
                      final seller = _activeSellers[index];
                      return EmployeesAcceptedWidget(
                        fullName: '${seller.lastName} ${seller.firstName}',
                        phoneNubmer: seller.phone,
                        role: roles!,
                        onPressed: () => _deleteUser(_company!.id, seller.id),
                        id: seller.id,
                      );
                    },
                  ),
                  if (_activeSellers.isEmpty)
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Нету активных сотрудников',
                        style: TextStyle(
                          fontSize: typography.bodyMedium?.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

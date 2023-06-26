import 'package:flutter/material.dart';
import 'package:salles_app/widgets/EmployeesConsiderationWidget.dart';

import '../locale/AppLocalizations.dart';
import '../models/Company.dart';
import '../service/CompanyService.dart';
import '../widgets/SwipeRefresh.dart';

class EmployeesConsiderationViews extends StatefulWidget {
  final String id;

  const EmployeesConsiderationViews({Key? key, required this.id})
      : super(key: key);

  @override
  State<EmployeesConsiderationViews> createState() =>
      _EmployeesConsiderationViewsState();
}

class _EmployeesConsiderationViewsState
    extends State<EmployeesConsiderationViews> {
  Company? _company;
  List<dynamic> _inactiveSellers = [];
  bool isLoaded = false;

  _getCompanyByOwnerId(String id) async {
    try {
      Company? company = await CompanyService().getCompanyByOwnerId(id);
      setState(() {
        _company = company;
      });
      _filterInactiveSellers();
      isLoaded = true;
      print(_company);
    } catch (e) {
      print('Error getting company by ID: $e');
    }
  }

  void _filterInactiveSellers() {
    _inactiveSellers =
        _company?.sellers.where((seller) => seller.enabled == false).toList() ??
            [];
  }

  @override
  void initState() {
    super.initState();
    _getCompanyByOwnerId(widget.id);
  }

  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return SwipeRefresh(
      onRefresh: () async {
        try {
          Company? company =
              await CompanyService().getCompanyByOwnerId(widget.id);
          setState(() {
            _company = company;
          });
          _filterInactiveSellers();
          isLoaded = true;
          print(_company);
          print('обновил');
        } catch (e) {
          print('Error getting company by ID: $e');
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 8),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Visibility(
                visible: isLoaded,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: _inactiveSellers.isNotEmpty
                    ? ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _inactiveSellers.length,
                        itemBuilder: (context, index) {
                          final seller = _inactiveSellers[index];
                          return EmployeesConsiderationWidget(
                            fullName: '${seller.lastName} ${seller.firstName}',
                            id: seller.id,
                            companyId: _company!.id,
                          );
                        },
                      )
                    : Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          localizations?.dontHaveEmployeesConsideration ?? '',
                          // 'У вас нету сотрудников на расмотрений',
                          style: TextStyle(
                            fontSize: typography.bodyMedium?.fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

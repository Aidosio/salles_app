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
  @override
  Company? _company;
  bool isLoaded = false;

  _getCompanyByOwnerId(String id) async {
    try {
      Company? company = await CompanyService().getCompanyByOwnerId(id);
      setState(() {
        _company = company;
      });
      isLoaded = true;
      print(_company);
    } catch (e) {
      print('Error getting company by ID: $e');
    }
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
          isLoaded = true;
          print(_company);
          print('обновил');
        } catch (e) {
          print('Error getting company by ID: $e');
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 8),
        child: Column(
          children: [
            Visibility(
              visible: isLoaded,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _company?.sellers.length,
                itemBuilder: (context, index) {
                  final seller = _company?.sellers[index];

                  if (seller?.enabled == false) {
                    return EmployeesConsiderationWidget(
                        fullName: '${seller?.lastName} ${seller?.firstName}',
                        id: seller?.id,
                        companyId: _company!.id);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

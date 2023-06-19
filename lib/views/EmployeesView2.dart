import 'package:flutter/material.dart';
import 'package:salles_app/models/Company.dart';
import 'package:salles_app/service/CompanyService.dart';
import 'package:salles_app/views/EmployeesAcceptedViews.dart';
import '../locale/AppLocalizations.dart';
import 'EmployeesConsiderationViews.dart';

class EmployeesView2 extends StatefulWidget {
  final String id;

  const EmployeesView2({Key? key, required this.id}) : super(key: key);

  @override
  State<EmployeesView2> createState() => _EmployeesViewState();
}

class _EmployeesViewState extends State<EmployeesView2> {
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

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: Scaffold(
        appBar: TabBar(
          tabs: <Widget>[
            Tab(
              text: "На рассмотрении",
            ),
            Tab(
              text: "Сотрудники",
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: TabBarView(children: <Widget>[
          EmployeesConsiderationViews(),
          EmployeesAcceptedViews(),
        ]),
      ),
    );
  }
}

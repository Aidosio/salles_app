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
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    String ids = widget.id;

    return DefaultTabController(
      initialIndex: 1,
      length: 2,
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
          EmployeesConsiderationViews(id: ids),
          EmployeesAcceptedViews(id: ids),
        ]),
      ),
    );
  }
}

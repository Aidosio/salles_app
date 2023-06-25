import 'package:flutter/material.dart';
import 'package:salles_app/models/Company.dart';
import 'package:salles_app/service/CompanyService.dart';
import 'package:salles_app/views/EmployeesAcceptedViews.dart';
import '../locale/AppLocalizations.dart';
import 'EmployeesConsiderationViews.dart';

class EmployeesView3 extends StatefulWidget {
  final String id;

  const EmployeesView3({Key? key, required this.id}) : super(key: key);

  @override
  State<EmployeesView3> createState() => _EmployeesViewState();
}

class _EmployeesViewState extends State<EmployeesView3> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    String ids = widget.id;

    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Scaffold(
        appBar: TabBar(
          tabs: <Widget>[
            Tab(
              text: localizations?.employees ?? '',
              // text: "Сотрудники",
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: TabBarView(children: <Widget>[
          EmployeesAcceptedViews(id: ids),
        ]),
      ),
    );
  }
}

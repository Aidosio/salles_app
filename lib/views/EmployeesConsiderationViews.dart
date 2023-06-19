import 'package:flutter/material.dart';
import 'package:salles_app/widgets/EmployeesConsiderationWidget.dart';

import '../locale/AppLocalizations.dart';

class EmployeesConsiderationViews extends StatefulWidget {
  const EmployeesConsiderationViews({super.key});

  @override
  State<EmployeesConsiderationViews> createState() =>
      _EmployeesConsiderationViewsState();
}

class _EmployeesConsiderationViewsState
    extends State<EmployeesConsiderationViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 8),
      child: Column(
        children: [
          EmployeesConsiderationWidget(
              fullName: 'fullName', id: 'id', companyId: 'companyId')
        ],
      ),
    );
  }
}

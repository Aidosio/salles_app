import 'package:flutter/material.dart';
import 'package:salles_app/widgets/EmployeesAcceptedWidget.dart';

import '../locale/AppLocalizations.dart';

class EmployeesAcceptedViews extends StatefulWidget {
  const EmployeesAcceptedViews({super.key});

  @override
  State<EmployeesAcceptedViews> createState() => _EmployeesAcceptedViewsState();
}

class _EmployeesAcceptedViewsState extends State<EmployeesAcceptedViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 8),
      child: Column(
        children: [
          EmployeesAcceptedWidget(
              fullName: 'fullName', id: 'id', phoneNubmer: 'phoneNubmer')
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:salles_app/widgets/EmployeesAcceptedWidget.dart';
import 'package:salles_app/widgets/EmployeesConsiderationWidget.dart';
import '../locale/AppLocalizations.dart';

class EmployeesView extends StatefulWidget {
  const EmployeesView({Key? key}) : super(key: key);

  @override
  State<EmployeesView> createState() => _EmployeesViewState();
}

class _EmployeesViewState extends State<EmployeesView> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 8),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'На рассмотрений',
                style: TextStyle(
                    fontSize: typography.bodyMedium?.fontSize,
                    fontWeight: FontWeight.w700),
              ),
            ),

            SizedBox(height: 5),

            Divider(
              height: 1,
              thickness: 2,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),

            SizedBox(height: 15),

            //компонент

            EmployeesConsiderationWidget(fullName: 'ФИО', id: '2'),
            EmployeesConsiderationWidget(fullName: 'ФИО', id: '2'),

            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Сотрудники',
                style: TextStyle(
                    fontSize: typography.bodyMedium?.fontSize,
                    fontWeight: FontWeight.w700),
              ),
            ),

            SizedBox(height: 5),

            Divider(
              height: 1,
              thickness: 2,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),

            SizedBox(height: 15),

            EmployeesAcceptedWidget(
                fullName: 'Арман Газис', phoneNubmer: '877056544', id: '3')
          ],
        ),
      ),
    );
  }
}

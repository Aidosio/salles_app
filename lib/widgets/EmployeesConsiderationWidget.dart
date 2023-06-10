import 'package:flutter/material.dart';
import 'package:salles_app/widgets/IconButtonDialogWidgets.dart';

import '../locale/AppLocalizations.dart';

class EmployeesConsiderationWidget extends StatelessWidget {
  final String fullName;
  final String id;
  const EmployeesConsiderationWidget({
    Key? key,
    required this.fullName,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Card(
      margin: EdgeInsets.only(bottom: 20, top: 0, right: 0, left: 0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              fullName,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: typography.bodyMedium?.fontSize,
                  fontWeight: FontWeight.w600),
            ),
            Row(children: [
              IconButtonDialogWidgets(
                  idYes: 'idYes',
                  idNo: 'idNo',
                  alertTitle: 'Вы уверены, что хотите нанять рабочего?',
                  icon: Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                  colorChoice: Colors.green.shade200),
              SizedBox(width: 15),
              IconButtonDialogWidgets(
                  idYes: 'idYes2',
                  idNo: 'idNo1',
                  alertTitle: 'Вы уверены, что не хотите нанимать рабочего?',
                  icon: Icon(Icons.delete_outline),
                  colorChoice: Colors.red.shade200)
            ]),
          ],
        ),
      ),
    );
  }
}

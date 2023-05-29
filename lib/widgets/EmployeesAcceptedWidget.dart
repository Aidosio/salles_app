import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class EmployeesAcceptedWidget extends StatelessWidget {
  final String fullName;
  final String id;
  const EmployeesAcceptedWidget({
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
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            fullName,
            style: TextStyle(
                color: Colors.black87,
                fontSize: typography.bodyMedium?.fontSize,
                fontWeight: FontWeight.w700),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.red.shade100,
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  print(id);
                },
                icon: Icon(
                  Icons.delete_outline,
                  size: 23,
                )),
          )
        ]),
      ),
    );
  }
}

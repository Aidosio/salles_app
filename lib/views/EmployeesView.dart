import 'package:flutter/material.dart';
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
      body: Column(
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

          SizedBox(height: 10),

          //компонент
          Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).colorScheme.outline),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Фамиля Имя Очество',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.green.shade100,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.done,
                            size: 23,
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.red.shade100,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_outline,
                            size: 23,
                          )),
                    )
                  ]),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

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

          SizedBox(height: 10),

          Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).colorScheme.outline),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Фамиля Имя Очество',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: typography.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.red.shade100,
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete_outline,
                                size: 23,
                              )),
                        )
                      ],
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

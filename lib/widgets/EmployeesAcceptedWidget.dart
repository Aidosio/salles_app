import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class EmployeesAcceptedWidget extends StatelessWidget {
  final String fullName;
  final String id;

  final String phoneNubmer;
  const EmployeesAcceptedWidget(
      {Key? key,
      required this.fullName,
      required this.id,
      required this.phoneNubmer})
      : super(key: key);

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: typography.bodyMedium?.fontSize,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                phoneNubmer,
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: typography.bodyMedium?.fontSize),
              ),
            ],
          ),
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red.shade200,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              backgroundColor: Colors.white,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Вы уверены, что хотите уволить сотрудника?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              typography.bodyLarge?.fontSize,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: FilledButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Нет"),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll<
                                                          Color>(
                                                      Colors.red.shade400),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                ),
                                              ),
                                              minimumSize:
                                                  MaterialStateProperty.all(
                                                Size(0, 40),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Expanded(
                                          child: FilledButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              print(id);
                                            },
                                            child: Text("Да"),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll<
                                                          Color>(
                                                      Colors.green.shade400),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                ),
                                              ),
                                              minimumSize:
                                                  MaterialStateProperty.all(
                                                Size(0, 40),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                    icon: Icon(
                      Icons.delete_outline,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class SalesRefundAcceptionCardWidgets extends StatelessWidget {
  const SalesRefundAcceptionCardWidgets({super.key});

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
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Название',
                    style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Цена',
                    style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Яблоко',
                    style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '6000' + ' тг',
                    style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.blue.shade100,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 5),
                                    content: Text('Вы сделали возврат'),
                                    action: SnackBarAction(
                                        label: 'Отменить',
                                        onPressed: () {
                                          print('object');
                                        }),
                                  ),
                                )
                                .closed
                                .then((SnackBarClosedReason reason) {
                              if (reason != SnackBarClosedReason.action) {
                                // Кнопка 'Отменить' не была нажата
                                print('id');
                              }
                            });
                            ;
                          },
                          icon: Icon(
                            Icons.wrap_text_rounded,
                            size: 20,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ])
                ],
              ),
            ]),
            SizedBox(height: 10),
            Container(
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Количество',
                  labelStyle:
                      TextStyle(fontSize: typography.bodyMedium?.fontSize),
                  hintText: '100',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class SalesRefundAcceptionCardWidgets extends StatelessWidget {
  final String name;
  final String price;
  final VoidCallback onPressed;

  const SalesRefundAcceptionCardWidgets({
    Key? key,
    required this.name,
    required this.price,
    required this.onPressed, // Добавьте это
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
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations?.justTitleName ?? '',
                    // 'Название',
                    style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Text(
                    localizations?.justTitlePrice ?? '',
                    // 'Цена',
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
                    name,
                    style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5),
                  Text(
                    price + ' тг',
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
                          onPressed: onPressed,
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
            // Container(
            //   child: TextField(
            //     keyboardType: TextInputType.phone,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Количество',
            //       labelStyle:
            //           TextStyle(fontSize: typography.bodyMedium?.fontSize),
            //       hintText: '100',
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

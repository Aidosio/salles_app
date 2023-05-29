import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class CategoryChildCardWidgets extends StatelessWidget {
  final String titleName;
  final String cost;
  final String quantity;
  final String barcode;
  final String categoryName;
  final String id;

  const CategoryChildCardWidgets(
      {Key? key,
      required this.titleName,
      required this.cost,
      required this.quantity,
      required this.barcode,
      required this.categoryName,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleName,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: typography.bodyText1?.fontSize,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Text(
                'Цена: ' + cost + ' тг',
                style: TextStyle(
                    fontSize: typography.bodyMedium?.fontSize,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 5),
              Text(
                'Количество: ' + quantity + ' шт',
                style: TextStyle(
                    fontSize: typography.bodyMedium?.fontSize,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 5),
              Text(
                'Штрихкод: ' + barcode,
                style: TextStyle(
                    fontSize: typography.bodyMedium?.fontSize,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 5),
              Text(
                'Категория: ' + categoryName,
                style: TextStyle(
                    fontSize: typography.bodyMedium?.fontSize,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        print(id);
                      },
                      child: Text("Удалить"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.red),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          Size(0, 40),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        print(id);
                      },
                      child: Text("Изменить"),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
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
      ),
    );
  }
}

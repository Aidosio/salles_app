import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class CategoryChildViews extends StatefulWidget {
  const CategoryChildViews({Key? key}) : super(key: key);

  @override
  State<CategoryChildViews> createState() => _CategoryChildViewsState();
}

class _CategoryChildViewsState extends State<CategoryChildViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Название',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: typography.headline6?.fontSize,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 10),
            Card(
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
                      'Название продукта',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: typography.bodyText1?.fontSize,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Цена: 1000 тг',
                      style: TextStyle(
                          fontSize: typography.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Количество: 30 шт',
                      style: TextStyle(
                          fontSize: typography.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Штрихкод: 10000000',
                      style: TextStyle(
                          fontSize: typography.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Категория: мясо и другое и мб яйца',
                      style: TextStyle(
                          fontSize: typography.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton(
                            onPressed: () {},
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
                            onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}

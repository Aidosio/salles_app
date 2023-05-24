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
            Expanded(
              child: Container(
                constraints: BoxConstraints(minWidth: 40),
                width: double.infinity,
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
                          'Название продукта',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: typography.bodyText1?.fontSize,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Цена: 1000тг'),
                            SizedBox(width: 5),
                            Text('Штрихкод: 100000'),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                'Категория: Молоко и другое и мб яйца',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                'Количество: 100 шт',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FilledButton(
                              onPressed: () {},
                              child: Text("Удалить"),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity, 40),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            FilledButton(
                              onPressed: () {},
                              child: Text("Удалить"),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity, 40),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

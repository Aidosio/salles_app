import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class CategoryChildViews extends StatefulWidget {
  const CategoryChildViews({super.key});

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
            fontSize: typography.headlineSmall?.fontSize,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle_outlined,
                color: Color.fromARGB(255, 75, 161, 207),
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.outline),
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
                            fontSize: typography.bodyMedium?.fontSize,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text('Цена: 1000тг'),
                          SizedBox(width: 5),
                          Text('Штрихкод: 100000')
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Flexible(child: Text('Категория: Название')),
                          SizedBox(width: 5),
                          Text('Количество: 100 шт')
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 130,
                            child: FilledButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.lightBlueAccent)),
                              onPressed: () => {
                                // Действие
                              },
                              child: const Text('Изменить'),
                            ),
                          ),
                          Container(
                            width: 130,
                            child: FilledButton(
                              onPressed: () {},
                              child: const Text('Удалить'),
                            ),
                          ),
                        ],
                      )
                    ],
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

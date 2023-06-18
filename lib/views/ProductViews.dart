import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';
import '../widgets/ProductTextFieldViews.dart';

class ProductViews extends StatefulWidget {
  const ProductViews({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductViews> createState() => _ProductViewsState();
}

class _ProductViewsState extends State<ProductViews> {
  String? selectedCategory;
  List<String> category = [
    'Молочные продукты и яйца',
    'Мясо и птица',
    'Колбасы и сосиски',
    'Хлебные изделия',
    'Сок, вода и напитки',
  ];

  @override
  Widget build(BuildContext context) {
    final barcode = ModalRoute.of(context)?.settings.arguments as String?;
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Назад', textAlign: TextAlign.left),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 8),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  ProductTextFieldViews(
                    isEnabled: true,
                    isPhone: false,
                    hintTextExample: 'Молоко',
                    labelTextExample: 'Название товара',
                    initialValue: '',
                  ),
                  ProductTextFieldViews(
                      isEnabled: true,
                      isPhone: true,
                      hintTextExample: '1465',
                      labelTextExample: 'Цена товара',
                      initialValue: ''),
                  DropdownButtonFormField<String>(
                    value: selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Категория товара',
                    ),
                    items: category.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(height: 15),
                  ProductTextFieldViews(
                    isEnabled: false,
                    isPhone: true,
                    hintTextExample: '10000000',
                    labelTextExample: '$barcode',
                    initialValue: barcode,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 45,
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Добавить',
                  style: TextStyle(
                    fontSize: typography.bodyMedium?.fontSize,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
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
        ),
      ),
    );
  }
}

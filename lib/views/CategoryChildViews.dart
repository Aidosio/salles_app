import 'package:flutter/material.dart';
import 'package:salles_app/widgets/CategoryChildCardWidgets.dart';

import '../locale/AppLocalizations.dart';

class CategoryChildViews extends StatefulWidget {
  const CategoryChildViews({Key? key}) : super(key: key);

  @override
  State<CategoryChildViews> createState() => _CategoryChildViewsState();
}

class _CategoryChildViewsState extends State<CategoryChildViews> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as String?;
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    final title = arguments ?? 'Не найдено';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: typography.headline6?.fontSize,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 8),
        child: Column(
          children: [
            CategoryChildCardWidgets(
              titleName: 'Огурцы',
              cost: '1000',
              quantity: '100',
              barcode: '10000000',
              categoryName: 'Пчоловидные',
              id: '1',
            ),
            CategoryChildCardWidgets(
              titleName: 'Слива',
              cost: '1500',
              quantity: '90',
              barcode: '11000000',
              categoryName: 'Xоловидные',
              id: '2',
            ),
          ],
        ),
      ),
    );
  }
}

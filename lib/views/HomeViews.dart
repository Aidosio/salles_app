import 'package:flutter/material.dart';
import 'package:salles_app/locale/AppLocalizations.dart';
import 'package:salles_app/widgets/CategoryChildCardWidgets.dart';
import 'package:salles_app/widgets/SalesHistoryWidget.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({super.key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 8),
          child: Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Последние продажи',
                      style: TextStyle(
                          fontSize: typography.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w600),
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
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 15),
                  SalesHistoryWidget(checkNum: '4564644', price: '4500'),
                  SalesHistoryWidget(checkNum: '4564644', price: '4500'),
                  SalesHistoryWidget(checkNum: '4564644', price: '4500'),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Последние добавленные товары',
                      style: TextStyle(
                          fontSize: typography.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w600),
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
                  SizedBox(height: 15),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    CategoryChildCardWidgets(
                        titleName: 'titleName',
                        cost: '4555',
                        quantity: 'quantity',
                        barcode: 'barcode',
                        categoryName: 'categoryName',
                        id: 'id'),
                    CategoryChildCardWidgets(
                        titleName: 'titleName',
                        cost: '4555',
                        quantity: 'quantity',
                        barcode: 'barcode',
                        categoryName: 'categoryName',
                        id: 'id')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

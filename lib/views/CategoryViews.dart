import 'package:flutter/material.dart';
import 'package:salles_app/widgets/CategoryCardWidgets.dart';
import '../locale/AppLocalizations.dart';
import 'CategoryChildViews.dart';

class CategoryViews extends StatefulWidget {
  const CategoryViews({super.key});

  @override
  State<CategoryViews> createState() => _CategoryViewsState();
}

class _CategoryViewsState extends State<CategoryViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 8),
        child: Column(
          children: [
            SizedBox(height: 10),
            CategoryCardWidgets(categoryName: 'Овощи и Фрукты'),
            CategoryCardWidgets(categoryName: 'Овощи и Фрукты'),
            CategoryCardWidgets(categoryName: 'Овощи и Фрукты'),
            CategoryCardWidgets(categoryName: 'Овощи и Фрукты'),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 50.0,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: FloatingActionButton.extended(
          onPressed: () {
            print('1');
          },
          label: const Text('Добавить товар'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.lightBlueAccent,
          foregroundColor: Colors.white,
          tooltip: "Добавить новый товар",
          extendedTextStyle: TextStyle(
              fontSize: typography.bodyMedium?.fontSize,
              fontWeight: FontWeight.w400),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}

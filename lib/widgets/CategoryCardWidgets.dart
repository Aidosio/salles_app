import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class CategoryCardWidgets extends StatelessWidget {
  final String categoryName;

  const CategoryCardWidgets({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 50,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/category-views',
            arguments: 'Овощи и фрукты',
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              // Добавляем Expanded вокруг RichText
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: 'Категория: ',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: typography.bodyMedium?.fontSize,
                      fontWeight: FontWeight.w600),
                  children: <TextSpan>[
                    TextSpan(
                      text: categoryName,
                      style: TextStyle(
                          color: Colors.blue.shade500,
                          fontWeight: FontWeight.w600),
                    ),
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

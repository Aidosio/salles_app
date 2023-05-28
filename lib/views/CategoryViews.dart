import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: 50,
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.outline),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryChildViews()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: 'Категория:',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: typography.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(text: ' '),
                        TextSpan(
                            text: 'Овощи и фрукты',
                            style: TextStyle(
                                color: Colors.lightBlueAccent.shade700)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.outline),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryChildViews()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: 'Категория:',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: typography.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(text: ' '),
                        TextSpan(
                            text: 'Молочные продукты и яйца',
                            style: TextStyle(
                                color: Colors.lightBlueAccent.shade700)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.outline),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryChildViews()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: 'Категория:',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: typography.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(text: ' '),
                        TextSpan(
                            text: 'Колбасы и сосиски',
                            style: TextStyle(
                                color: Colors.lightBlueAccent.shade700)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.outline),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryChildViews()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: 'Категория:',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: typography.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(text: ' '),
                        TextSpan(
                            text: 'Мясо и птица',
                            style: TextStyle(
                                color: Colors.lightBlueAccent.shade700)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.outline),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryChildViews()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: 'Категория:',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: typography.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(text: ' '),
                        TextSpan(
                            text: 'Рыба и морепродукты',
                            style: TextStyle(
                                color: Colors.lightBlueAccent.shade700)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 50.0,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: FloatingActionButton.extended(
          onPressed: () {
            // Действие
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

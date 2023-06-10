import 'package:flutter/material.dart';
import '../locale/AppLocalizations.dart';

class ChoiseViews extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const ChoiseViews({Key? key, required this.changeLanguage}) : super(key: key);

  @override
  State<ChoiseViews> createState() => _ChoiseViewsState();
}

class _ChoiseViewsState extends State<ChoiseViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                localizations?.areYouHow ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 81, 86, 88),
                  fontSize: typography.headlineMedium?.fontSize,
                ),
              ),
              SizedBox(height: 35),
              FilledButton.tonal(
                onPressed: () {
                  Navigator.pushNamed(context, '/reg', arguments: '0');
                },
                child: Text("Владелец"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  minimumSize:
                      MaterialStateProperty.all(Size(double.infinity, 48)),
                ),
              ),
              SizedBox(height: 20),
              FilledButton.tonal(
                onPressed: () {
                  Navigator.pushNamed(context, '/reg', arguments: '1');
                },
                child: Text("Продавец"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  minimumSize:
                      MaterialStateProperty.all(Size(double.infinity, 48)),
                ),
              ),
            ],
          )),
    );
  }
}

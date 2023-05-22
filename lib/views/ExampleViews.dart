import 'package:flutter/material.dart';
import '../locale/AppLocalizations.dart';

class ExampleViews extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const ExampleViews({Key? key, required this.changeLanguage})
      : super(key: key);

  @override
  State<ExampleViews> createState() => _ExampleViewsState();
}

class _ExampleViewsState extends State<ExampleViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            Text(
              'data',
              style: TextStyle(fontSize: typography.displayLarge?.fontSize),
            )
          ],
        ),
      ),
    );
  }
}

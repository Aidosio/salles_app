import 'package:flutter/material.dart';
import '../locale/AppLocalizations.dart';

class EmployeesView extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const EmployeesView({Key? key, required this.changeLanguage})
      : super(key: key);

  @override
  State<EmployeesView> createState() => _EmployeesViewState();
}

class _EmployeesViewState extends State<EmployeesView> {
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
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'data',
                style: TextStyle(fontSize: typography.bodyLarge?.fontSize),
              ),
            ),
            Divider(
              height: 1,
              thickness: 2,
              indent: 0,
              endIndent: 0,
              color: Color.fromARGB(74, 74, 74, 1),
            ),

            //компонент
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: const SizedBox(
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Text('Фамиля Имя Очество'),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

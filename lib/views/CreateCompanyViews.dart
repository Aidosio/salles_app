import 'package:flutter/material.dart';
import '../locale/AppLocalizations.dart';

class CreateCompanyViews extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const CreateCompanyViews({Key? key, required this.changeLanguage})
      : super(key: key);

  @override
  State<CreateCompanyViews> createState() => _CreateCompanyViewsState();
}

class _CreateCompanyViewsState extends State<CreateCompanyViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Регистрация компаний',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 81, 86, 88),
                  fontSize: typography.headlineMedium?.fontSize,
                ),
              ),
              SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Название компаний',
                  hintText: 'Название компаний',
                  prefixIcon: Icon(Icons.business),
                ),
              ),
              SizedBox(height: 30),
              FilledButton.tonal(
                onPressed: () {},
                child: Text("Зарегистрироваться"),
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
          ),
        ),
      ),
    );
  }
}

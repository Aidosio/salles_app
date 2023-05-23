import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:salles_app/views/MainViews.dart';

import '../locale/AppLocalizations.dart';

class LoginViews extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const LoginViews({Key? key, required this.changeLanguage}) : super(key: key);

  @override
  _LoginViewsState createState() => _LoginViewsState();
}

class _LoginViewsState extends State<LoginViews> {
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      localizations?.enter ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 81, 86, 88),
                        fontSize: typography.headlineMedium?.fontSize,
                      ),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [MaskedInputFormatter('+###-###-##-##')],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '+777-777-77-77',
                        labelText: 'Номер телефона',
                        prefixIcon: Icon(Icons.phone_android_sharp),
                      ),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Пароль',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    SizedBox(height: 30),
                    FilledButton.tonal(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainViews(
                                    changeLanguage: (Locale) {},
                                  )),
                        );
                      },
                      child: Text("Войти"),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 48)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/choise');
                      },
                      child: Text('Зарегистрироваться'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () =>
                        widget.changeLanguage(const Locale('ru', '')),
                    child: Text('Русский'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Locale('ru', '') == Locale('ru', '')
                            ? Colors.lightBlue.shade50
                            : null,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        widget.changeLanguage(const Locale('es', '')),
                    child: Text('Казахский'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Locale('es', '') == Locale('es', '')
                            ? null
                            : Colors.lightBlue.shade50,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

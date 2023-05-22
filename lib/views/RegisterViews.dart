import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import '../locale/AppLocalizations.dart';

class RegisterViews extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const RegisterViews({Key? key, required this.changeLanguage})
      : super(key: key);

  @override
  State<RegisterViews> createState() => _RegisterViewsState();
}

class _RegisterViewsState extends State<RegisterViews> {
  bool color = false;

  void changeLanguageAndColor(colors, Locale locale) {
    setState(() {
      color = colors;
    });
    widget.changeLanguage(locale);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as String;
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
                  children: [
                    Text(
                      'Регистрация',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 81, 86, 88),
                        fontSize: typography.headlineMedium?.fontSize,
                      ),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Имя',
                        hintText: 'Имя',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Фамилия',
                        hintText: 'Фамилия',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 30),
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
                        hintText: 'Пароль',
                        labelText: 'Пароль',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    SizedBox(height: 30),
                    FilledButton.tonal(
                      onPressed: () {
                        Navigator.pushNamed(
                            context,
                            arguments == 'Owner'
                                ? '/createCompany'
                                : '/choiseCompany');
                      },
                      child: Text("Дальше"),
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
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text('Войти'),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () =>
                        changeLanguageAndColor(false, const Locale('ru', '')),
                    child: Text('Русский'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        color == false ? Colors.lightBlue.shade50 : null,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        changeLanguageAndColor(true, const Locale('es', '')),
                    child: Text('Казахский'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        color == true ? Colors.lightBlue.shade50 : null,
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

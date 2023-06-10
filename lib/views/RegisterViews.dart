import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:salles_app/service/RegService.dart';
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

  String firstname = '';
  String lastname = '';
  String phoneNumber = '';
  String password = '';

  String errorfirstname = '';
  String errorlastname = '';
  String errorphoneNumber = '';
  String errorpassword = '';

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
                        errorText:
                            errorfirstname.isEmpty ? null : errorfirstname,
                      ),
                      onChanged: (value) {
                        setState(() {
                          firstname = value;
                        });
                      },
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Фамилия',
                        hintText: 'Фамилия',
                        prefixIcon: Icon(Icons.person),
                        errorText: errorlastname.isEmpty ? null : errorlastname,
                      ),
                      onChanged: (value) {
                        setState(() {
                          lastname = value;
                        });
                      },
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
                        errorText:
                            errorphoneNumber.isEmpty ? null : errorphoneNumber,
                      ),
                      onChanged: (value) {
                        setState(() {
                          phoneNumber = value;
                        });
                      },
                    ),
                    SizedBox(height: 24),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Пароль',
                        labelText: 'Пароль',
                        prefixIcon: Icon(Icons.lock),
                        errorText: errorpassword.isEmpty ? null : errorpassword,
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    SizedBox(height: 30),
                    FilledButton.tonal(
                      onPressed: () async {
                        if (firstname.isEmpty &&
                            lastname.isEmpty &&
                            phoneNumber.isEmpty &&
                            password.isEmpty) {
                          print('Ошибка: Введите номер телефона и пароль');
                          setState(() {
                            errorfirstname =
                                "Ошибка при вводе имени: 'Ошибка: Введите имя'.";
                            errorlastname =
                                "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
                            errorphoneNumber =
                                "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
                            errorpassword =
                                "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
                          });
                          return;
                        }
                        if (lastname.isEmpty &&
                            phoneNumber.isEmpty &&
                            password.isEmpty) {
                          print('Ошибка: Введите номер телефона и пароль');
                          setState(() {
                            errorlastname =
                                "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
                            errorphoneNumber =
                                "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
                            errorpassword =
                                "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
                          });
                          return;
                        }
                        if (phoneNumber.isEmpty && password.isEmpty) {
                          print('Ошибка: Введите номер телефона и пароль');
                          setState(() {
                            errorphoneNumber =
                                "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
                            errorpassword =
                                "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
                          });
                          return;
                        }

                        if (password.isEmpty) {
                          print(
                              "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.");
                          setState(() {
                            errorfirstname = '';
                            errorlastname = '';
                            errorphoneNumber = '';
                            errorpassword =
                                "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
                          });
                          return;
                        }
                        if (firstname.isEmpty) {
                          print(
                              "Ошибка при вводе имени: 'Ошибка: Введите имя'.");
                          setState(() {
                            errorfirstname =
                                "Ошибка при вводе имени: 'Ошибка: Введите имя'.";
                            errorlastname = '';
                            errorphoneNumber = '';
                            errorpassword = '';
                          });
                          return;
                        }
                        if (lastname.isEmpty) {
                          print(
                              "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.");
                          setState(() {
                            errorfirstname = "";
                            errorlastname =
                                "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
                            errorphoneNumber = '';
                            errorpassword = '';
                          });
                          return;
                        }
                        if (phoneNumber.isEmpty) {
                          print(
                              "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.");
                          setState(() {
                            errorfirstname = "";
                            errorlastname = "";
                            errorphoneNumber =
                                "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
                            errorpassword = '';
                          });
                          return;
                        }

                        setState(() {
                          errorfirstname = "";
                          errorlastname = "";
                          errorphoneNumber = "";
                          errorpassword = '';
                        });

                        final phoneNumberWithoutDashes =
                            phoneNumber.replaceAll('-', '');
                        print('firstname: $firstname');
                        print('lastname: $lastname');
                        print(
                            'phoneNumberWithoutDashes: $phoneNumberWithoutDashes');
                        print('password: $password');
                        print('arguments: $arguments');

                        RegService.reg(firstname, lastname,
                                phoneNumberWithoutDashes, arguments, password)
                            .then((_) {
                          // Проверяем, была ли успешная авторизация
                          if (RegService.token != null) {
                            // Авторизация успешна, переходим на главный экран
                            Navigator.pushNamed(
                                context,
                                arguments == '0'
                                    ? '/createCompany'
                                    : '/choiseCompany');
                          } else {
                            // Ошибка авторизации, выводим сообщение об ошибке
                            print('Ошибка авторизации');
                          }
                        });
                      },
                      child: Text("Продолжить"),
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
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, '/');
                    //   },
                    //   child: Text('Войти'),
                    // ),
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

import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:salles_app/service/RegService.dart';
import '../locale/AppLocalizations.dart';
import '../widgets/BlockedRefreshWidgets.dart';

class RegisterViews extends StatefulWidget {
  final Function(Locale) changeLanguage;
  final Locale currentLocale;

  const RegisterViews({
    Key? key,
    required this.changeLanguage,
    required this.currentLocale,
  }) : super(key: key);

  @override
  State<RegisterViews> createState() => _RegisterViewsState();
}

class _RegisterViewsState extends State<RegisterViews> {
  String firstname = '';
  String lastname = '';
  String phoneNumber = '';
  String password = '';

  String errorFirstname = '';
  String errorLastname = '';
  String errorPhoneNumber = '';
  String errorPassword = '';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as String;
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    bool isEnglish = widget.currentLocale.languageCode.toString() != 'ru';

    void changeLanguageAndColor(bool isEnglish, Locale locale) {
      setState(() {
        isEnglish = isEnglish;
      });
      widget.changeLanguage(locale);
    }

    void validateFieldsAndSubmit() {
      if (firstname.isEmpty &&
          lastname.isEmpty &&
          phoneNumber.isEmpty &&
          password.isEmpty) {
        print('Ошибка: Введите номер телефона и пароль');
        setState(() {
          errorFirstname = "Ошибка при вводе имени: 'Ошибка: Введите имя'.";
          errorLastname =
              "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
          errorPhoneNumber =
              "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
          errorPassword = "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
        });
        return;
      }
      if (lastname.isEmpty && phoneNumber.isEmpty && password.isEmpty) {
        print('Ошибка: Введите номер телефона и пароль');
        setState(() {
          errorLastname =
              "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
          errorPhoneNumber =
              "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
          errorPassword = "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
        });
        return;
      }
      if (phoneNumber.isEmpty && password.isEmpty) {
        print('Ошибка: Введите номер телефона и пароль');
        setState(() {
          errorPhoneNumber =
              "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
          errorPassword = "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
        });
        return;
      }

      if (password.isEmpty) {
        print("Ошибка при вводе пароля: 'Ошибка: Введите пароль'.");
        setState(() {
          errorFirstname = '';
          errorLastname = '';
          errorPhoneNumber = '';
          errorPassword = "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
        });
        return;
      }
      if (firstname.isEmpty) {
        print("Ошибка при вводе имени: 'Ошибка: Введите имя'.");
        setState(() {
          errorFirstname = "Ошибка при вводе имени: 'Ошибка: Введите имя'.";
          errorLastname = '';
          errorPhoneNumber = '';
          errorPassword = '';
        });
        return;
      }
      if (lastname.isEmpty) {
        print("Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.");
        setState(() {
          errorFirstname = "";
          errorLastname =
              "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
          errorPhoneNumber = '';
          errorPassword = '';
        });
        return;
      }
      if (phoneNumber.isEmpty) {
        print(
            "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.");
        setState(() {
          errorFirstname = "";
          errorLastname = "";
          errorPhoneNumber =
              "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
          errorPassword = '';
        });
        return;
      }

      setState(() {
        errorFirstname = '';
        errorLastname = '';
        errorPhoneNumber = '';
        errorPassword = '';
      });

      setState(() {
        isLoading = true;
      });

      final phoneNumberWithoutDashes = phoneNumber.replaceAll('-', '');
      print('firstname: $firstname');
      print('lastname: $lastname');
      print('phoneNumberWithoutDashes: $phoneNumberWithoutDashes');
      print('password: $password');
      print('arguments: $arguments');

      RegService.reg(firstname, lastname, phoneNumberWithoutDashes, arguments,
              password)
          .then((_) {
        // Проверяем, была ли успешная авторизация
        if (RegService.token != null) {
          // Авторизация успешна, переходим на главный экран
          Navigator.pushNamed(
            context,
            arguments == '0' ? '/createCompany' : '/choiseCompany',
          );
          setState(() {
            isLoading = false;
          });
        } else {
          // Ошибка авторизации, выводим сообщение об ошибке
          print('Ошибка авторизации');
        }
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Stack(
        children: [
          Align(
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
                            errorText: errorFirstname.isNotEmpty
                                ? errorFirstname
                                : null,
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
                            errorText:
                                errorLastname.isNotEmpty ? errorLastname : null,
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
                          inputFormatters: [
                            MaskedInputFormatter('+###-###-##-##')
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '+777-777-77-77',
                            labelText: 'Номер телефона',
                            prefixIcon: Icon(Icons.phone_android_sharp),
                            errorText: errorPhoneNumber.isNotEmpty
                                ? errorPhoneNumber
                                : null,
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
                            errorText:
                                errorPassword.isNotEmpty ? errorPassword : null,
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
                                errorFirstname =
                                    "Ошибка при вводе имени: 'Ошибка: Введите имя'.";
                                errorLastname =
                                    "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
                                errorPhoneNumber =
                                    "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
                                errorPassword =
                                    "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
                              });
                              return;
                            }
                            if (lastname.isEmpty &&
                                phoneNumber.isEmpty &&
                                password.isEmpty) {
                              print('Ошибка: Введите номер телефона и пароль');
                              setState(() {
                                errorLastname =
                                    "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
                                errorPhoneNumber =
                                    "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
                                errorPassword =
                                    "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
                              });
                              return;
                            }
                            if (phoneNumber.isEmpty && password.isEmpty) {
                              print('Ошибка: Введите номер телефона и пароль');
                              setState(() {
                                errorPhoneNumber =
                                    "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
                                errorPassword =
                                    "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
                              });
                              return;
                            }

                            if (password.isEmpty) {
                              print(
                                  "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.");
                              setState(() {
                                errorFirstname = '';
                                errorLastname = '';
                                errorPhoneNumber = '';
                                errorPassword =
                                    "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
                              });
                              return;
                            }
                            if (firstname.isEmpty) {
                              print(
                                  "Ошибка при вводе имени: 'Ошибка: Введите имя'.");
                              setState(() {
                                errorFirstname =
                                    "Ошибка при вводе имени: 'Ошибка: Введите имя'.";
                                errorLastname = '';
                                errorPhoneNumber = '';
                                errorPassword = '';
                              });
                              return;
                            }
                            if (lastname.isEmpty) {
                              print(
                                  "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.");
                              setState(() {
                                errorFirstname = "";
                                errorLastname =
                                    "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
                                errorPhoneNumber = '';
                                errorPassword = '';
                              });
                              return;
                            }
                            if (phoneNumber.isEmpty) {
                              print(
                                  "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.");
                              setState(() {
                                errorFirstname = "";
                                errorLastname = "";
                                errorPhoneNumber =
                                    "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
                                errorPassword = '';
                              });
                              return;
                            }

                            setState(() {
                              errorFirstname = '';
                              errorLastname = '';
                              errorPhoneNumber = '';
                              errorPassword = '';
                            });

                            setState(() {
                              isLoading = true;
                            });

                            final phoneNumberWithoutDashes =
                                phoneNumber.replaceAll('-', '');
                            print('firstname: $firstname');
                            print('lastname: $lastname');
                            print(
                                'phoneNumberWithoutDashes: $phoneNumberWithoutDashes');
                            print('password: $password');
                            print('arguments: $arguments');

                            await RegService.reg(firstname, lastname,
                                phoneNumberWithoutDashes, arguments, password);

                            // Проверяем, была ли успешная авторизация
                            print('token tuuuuut ${RegService.token} ');
                            if (RegService.token != null) {
                              // Авторизация успешна, переходим на главный экран
                              Navigator.pushNamed(
                                  context,
                                  arguments == '0'
                                      ? '/createCompany'
                                      : '/choiseCompany',
                                  arguments: RegService.token);
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              // Ошибка авторизации, выводим сообщение об ошибке
                              print('Ошибка авторизации');
                            }
                          },
                          child: Text(
                            'Зарегистрироваться',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 81, 86, 88),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Switch language to',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 81, 86, 88),
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          changeLanguageAndColor(isEnglish, Locale('ru', 'RU'));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: isEnglish ? null : Colors.grey[400],
                          onPrimary: Colors.black,
                        ),
                        child: Text('Русский'),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          changeLanguageAndColor(isEnglish, Locale('en', 'US'));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: isEnglish ? Colors.grey[400] : null,
                          onPrimary: Colors.black,
                        ),
                        child: Text('English'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          BlockedRefreshWidgets(
            isVisible: isLoading,
          ),
        ],
      ),
    );
  }
}

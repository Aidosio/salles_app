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
          errorFirstname = localizations?.errorEnteringName ?? '';
          // "Ошибка при вводе имени: 'Ошибка: Введите имя'.";
          errorLastname = localizations?.errorEnteringLastName ?? '';
          // "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
          errorPhoneNumber = localizations?.errorEnteringPhoneNumber ?? '';
          // "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
          errorPassword = localizations?.errorEnteringPassword ?? '';
          // "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
        });
        return;
      }
      if (lastname.isEmpty && phoneNumber.isEmpty && password.isEmpty) {
        print('Ошибка: Введите номер телефона и пароль');
        setState(() {
          errorLastname = localizations?.errorEnteringLastName ?? '';
          // "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
          errorPhoneNumber = localizations?.errorEnteringPhoneNumber ?? '';
          // "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
          errorPassword = localizations?.errorEnteringPassword ?? '';
          // "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
        });
        return;
      }
      if (phoneNumber.isEmpty && password.isEmpty) {
        print('Ошибка: Введите номер телефона и пароль');
        setState(() {
          errorPhoneNumber =
              errorPhoneNumber = localizations?.errorEnteringPhoneNumber ?? '';
          // "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
          errorPassword =
              errorPassword = localizations?.errorEnteringPassword ?? '';
          // "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
        });
        return;
      }

      if (password.isEmpty) {
        print("Ошибка при вводе пароля: 'Ошибка: Введите пароль'.");
        setState(() {
          errorFirstname = '';
          errorLastname = '';
          errorPhoneNumber = '';
          errorPassword = localizations?.errorEnteringPassword ?? '';
          // "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
        });
        return;
      }
      if (firstname.isEmpty) {
        print("Ошибка при вводе имени: 'Ошибка: Введите имя'.");
        setState(() {
          errorFirstname = localizations?.errorEnteringName ?? '';
          // "Ошибка при вводе имени: 'Ошибка: Введите имя'.";
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
          errorLastname = localizations?.errorEnteringLastName ?? '';
          // "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
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
          errorPhoneNumber = localizations?.errorEnteringPhoneNumber ?? '';
          // "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
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
                          localizations?.registrationPage ?? '',
                          // 'Регистрация',
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
                            labelText: localizations?.personFirstName ?? '',
                            // 'Имя',
                            hintText: localizations?.personFirstName ?? '',
                            // 'Имя',
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
                            labelText: localizations?.personSecondName ?? '',
                            // 'Фамилия',
                            hintText: localizations?.personSecondName ?? '',
                            // 'Фамилия',
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
                            labelText: localizations?.phoneNumber ?? '',
                            // 'Номер телефона',
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
                            hintText: localizations?.password ?? '',
                            // 'Пароль',
                            labelText: localizations?.password ?? '',
                            // 'Пароль',
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
                                    localizations?.errorEnteringName ?? '';
                                // "Ошибка при вводе имени: 'Ошибка: Введите имя'.";
                                errorLastname =
                                    localizations?.errorEnteringLastName ?? '';
                                // "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
                                errorPhoneNumber =
                                    localizations?.errorEnteringPhoneNumber ??
                                        '';
                                // "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
                                errorPassword =
                                    localizations?.errorEnteringPassword ?? '';
                                // "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
                              });
                              return;
                            }
                            if (lastname.isEmpty &&
                                phoneNumber.isEmpty &&
                                password.isEmpty) {
                              print('Ошибка: Введите номер телефона и пароль');
                              setState(() {
                                errorLastname =
                                    localizations?.errorEnteringLastName ?? '';
                                // "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
                                errorPhoneNumber =
                                    localizations?.errorEnteringPhoneNumber ??
                                        '';
                                // "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
                                errorPassword =
                                    localizations?.errorEnteringPassword ?? '';
                                // "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
                              });
                              return;
                            }
                            if (phoneNumber.isEmpty && password.isEmpty) {
                              print('Ошибка: Введите номер телефона и пароль');
                              setState(() {
                                errorPhoneNumber =
                                    localizations?.errorEnteringPhoneNumber ??
                                        '';
                                // "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
                                errorPassword =
                                    localizations?.errorEnteringPassword ?? '';
                                // "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
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
                                    localizations?.errorEnteringPassword ?? '';
                                // "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.";
                              });
                              return;
                            }
                            if (firstname.isEmpty) {
                              print(
                                  "Ошибка при вводе имени: 'Ошибка: Введите имя'.");
                              setState(() {
                                errorFirstname =
                                    localizations?.errorEnteringName ?? '';
                                // "Ошибка при вводе имени: 'Ошибка: Введите имя'.";
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
                                    localizations?.errorEnteringLastName ?? '';
                                // "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.";
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
                                    localizations?.errorEnteringPhoneNumber ??
                                        '';
                                // "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.";
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
                            localizations?.enter ?? '',
                            // "Войти",
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(
                                Size(double.infinity, 48)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => changeLanguageAndColor(
                            false, const Locale('ru', '')),
                        child: Text('Рус'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      TextButton(
                        onPressed: () {
                          changeLanguageAndColor(true, const Locale('es', ''));
                          print(widget.currentLocale.languageCode);
                        },
                        child: Text('Қаз'),
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

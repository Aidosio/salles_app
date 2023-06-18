import 'package:flutter/material.dart';
import 'package:salles_app/locale/AppLocalizations.dart';
import 'package:salles_app/models/Company.dart';
import 'package:salles_app/models/Users.dart';
import 'package:salles_app/service/Auth.dart';

class MainDrawerWidgets extends StatelessWidget {
  final Users? user;
  final Company? company;
  final void Function(bool, Locale) changeLanguageAndColor;
  final String? langCurrent;
  final void Function() onLogout;

  const MainDrawerWidgets({
    Key? key,
    required this.user,
    required this.company,
    required this.changeLanguageAndColor,
    required this.langCurrent,
    required this.onLogout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  ListTile(
                    title: Text(
                      user != null
                          ? '${company?.owner.lastName} ${company?.owner.firstName}'
                          : 'username',
                      style: TextStyle(
                        fontSize: 18, // Set your desired font size
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      user != null
                          ? '${localizations?.phoneNumber ?? 'Номер'}: ${company?.owner.phone}'
                          : '${localizations?.phoneNumber ?? 'Номер'}: нету',
                      style: TextStyle(
                        fontSize: 18, // Set your desired font size
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      company?.name ?? 'Default Company Name',
                    ),
                  ),
                  ListTile(
                    title: Text(
                      company?.owner != null
                          ? 'Статус: ${company!.owner.enabled ? "Активен" : "Не активен"}'
                          : 'Номер: нету',
                    ),
                  ),
                  ListTile(
                    title: Text(
                      company?.owner != null
                          ? 'Вы: ${company!.owner.role == "OWNER" ? "Владелец" : "Сотрудник"}'
                          : 'Номер: нету',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => changeLanguageAndColor(
                      langCurrent == 'ru',
                      const Locale('ru', ''),
                    ),
                    child: Text('Рус'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors == false ? Colors.lightBlue.shade50 : null,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () => changeLanguageAndColor(
                      langCurrent == 'es',
                      const Locale('es', ''),
                    ),
                    child: Text('Қаз'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors == true ? Colors.lightBlue.shade50 : null,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onLogout,
                child: Text('Выйти'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

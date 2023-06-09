import 'package:flutter/material.dart';
import 'package:salles_app/locale/AppLocalizations.dart';
import 'package:salles_app/models/Company.dart';
import 'package:salles_app/models/Users.dart';
import 'package:salles_app/service/Auth.dart';
import 'package:salles_app/service/CompanyService.dart';
import 'package:salles_app/service/User.dart';
import 'package:salles_app/views/CategoryViews.dart';
import 'package:salles_app/views/EmployeesView.dart';
import 'package:salles_app/views/HomeViews.dart';
import 'package:salles_app/views/LoginViews.dart';
import 'package:salles_app/views/RecordViews.dart';
import 'package:salles_app/views/SalesViews.dart';

class MainViews extends StatefulWidget {
  final Function(Locale) changeLanguage;
  final Locale currentLocale;

  const MainViews(
      {Key? key, required this.changeLanguage, required this.currentLocale})
      : super(key: key);

  @override
  State<MainViews> createState() => _MainViewsState();
}

class _MainViewsState extends State<MainViews> {
  int currentPageIndex = 0;
  List<String> pageNames = [
    'Главная',
    'Категория',
    'Оформить',
    'Сотрудники',
    'Продажи',
  ];

  String _ids = '';
  Users? _user;
  Company? _company;

  void getIdUser() async {
    String? userId = await Auth.getUserId();
    if (userId != null) {
      setState(() {
        _ids = userId;
      });
      print('User ID: $userId');
      _userById(_ids);
      _getCompanyByOwnerId(_ids);
    } else {
      print('User is not authenticated');
    }
  }

  _getCompanyByOwnerId(String id) async {
    try {
      Company? company = await CompanyService().getCompanyByOwnerId(id);
      setState(() {
        _company = company;
      });
      print(_company);
    } catch (e) {
      print('Error getting company by ID: $e');
    }
  }

  _userById(id) async {
    Users? user = await User().userById(id);
    setState(() {
      _user = user;
    });
  }

  // void _userById(id) async {
  //   Users? user = await User.userById(id);
  //   setState(() {
  //     _user = user;
  //     print(_user);
  //   });
  // }

  @override
  void initState() {
    super.initState();
    getIdUser();
  }
  // Future<void> _initializeAuth() async {
  //   bool isLoggedIn = await Auth.getUserId();
  // setState(() {
  //   _isLoggedIn = isLoggedIn;
  // });
  // }

  // String _getId() {
  //   String id = Auth.getUserId();
  // }

  GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Добавленный ключ Scaffold

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    PageController _pageController = PageController(initialPage: 0);
    List<Widget> _pages = [
      HomeViews(),
      CategoryViews(),
      RecordViews(),
      EmployeesView(
        id: _ids,
      ),
      SalesViews(),
    ];

    bool? color;
    String? langCurrent = widget.currentLocale.languageCode;

    void changeLanguageAndColor(colors, Locale locale) {
      setState(() {
        color = colors;
      });
      widget.changeLanguage(locale);
    }

    return Scaffold(
      key: _scaffoldKey, // Добавление ключа Scaffold
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          pageNames[currentPageIndex],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: typography.headlineSmall?.fontSize,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton.filledTonal(
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer(); // Открытие Drawer
              },
              icon: Icon(
                Icons.account_circle_outlined,
                color: Color.fromARGB(255, 75, 161, 207),
                size: 30,
              ),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Container(
            //   height: 160,
            //   child: DrawerHeader(
            //     decoration: BoxDecoration(
            //       color: Colors.blue,
            //     ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [

            //       ],
            //     ),
            //   ),
            // ),
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
                        _user != null
                            ? '${_company?.owner.lastName} ${_company?.owner.firstName}'
                            : 'username',
                        style: TextStyle(
                          fontSize: 18, // Установите желаемый размер шрифта
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        _user != null
                            ? '${localizations?.phoneNumber ?? 'Номер'}: ${_company?.owner.phone}'
                            : '${localizations?.phoneNumber ?? 'Номер'}: нету',
                        style: TextStyle(
                          fontSize: 18, // Установите желаемый размер шрифта
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        _company?.name ?? 'Default Company Name',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        _company?.owner != null
                            ? 'Статус: ${_company!.owner.enabled ? "Активен" : "Не активен"}'
                            : 'Номер: нету',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        _company?.owner != null
                            ? 'Вы: ${_company!.owner.role == "OWNER" ? "Владелец" : "Сотрудник"}'
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
                          langCurrent == 'ru', const Locale('ru', '')),
                      child: Text('Рус'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          color == false ? Colors.lightBlue.shade50 : null,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () => changeLanguageAndColor(
                          langCurrent == 'es', const Locale('es', '')),
                      child: Text('Қаз'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          color == true ? Colors.lightBlue.shade50 : null,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Auth.logout();
                    // Дополнительный код, который может потребоваться после выхода
                  },
                  child: TextButton(
                    onPressed: () {
                      Auth.logout();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginViews(
                            changeLanguage: widget.changeLanguage,
                            currentLocale: widget.currentLocale,
                          ),
                        ),
                      );
                    },
                    child: Text('Выйти'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        // padding: EdgeInsets.only(left: 15, right: 15, bottom: 0, top: 8),
        child: _pages[currentPageIndex],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Главная',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Категория',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.document_scanner),
            icon: Icon(Icons.document_scanner_outlined),
            label: 'Оформить',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.people_alt),
            icon: Icon(Icons.people_alt_outlined),
            label: 'Сотрудники',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.fact_check),
            icon: Icon(Icons.fact_check_outlined),
            label: 'Продажи',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:salles_app/locale/AppLocalizations.dart';
import 'package:salles_app/models/Company.dart';
import 'package:salles_app/models/Users.dart';
import 'package:salles_app/service/Auth.dart';
import 'package:salles_app/service/CompanyService.dart';
import 'package:salles_app/service/User.dart';
import 'package:salles_app/views/CategoryViews.dart';
import 'package:salles_app/views/EmployeesView.dart';
import 'package:salles_app/views/EmployeesView2.dart';
import 'package:salles_app/views/HomeViews.dart';
import 'package:salles_app/views/LoginViews.dart';
import 'package:salles_app/views/RecordViews.dart';
import 'package:salles_app/views/SalesViews.dart';
import 'package:salles_app/views/SalesViews2.dart';

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
  String mainPage = '';
  String categoryPage = '';
  String recordPage = '';
  String employees = '';
  String salesPage = '';

  int currentPageIndex = 0;

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
      if (await Auth.checkRole('OWNER')) {
        _getCompanyByOwnerId(_ids);
      } else {
        _getCompanyBySallerId(_ids);
      }
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

  _getCompanyBySallerId(String id) async {
    try {
      Company? company = await CompanyService().getCompanyBySallerId(id);
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

  @override
  void initState() {
    super.initState();
    getIdUser();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    List<String> pageNames = [
      mainPage,
      categoryPage,
      recordPage,
      employees,
      salesPage,
    ];
    TextTheme typography = Theme.of(context).textTheme;
    PageController _pageController = PageController(initialPage: 0);
    mainPage = localizations?.mainPage ?? '';
    categoryPage = localizations?.categoryPage ?? '';
    recordPage = localizations?.recordPage ?? '';
    employees = localizations?.employees ?? '';
    salesPage = localizations?.salesPage ?? '';
    List<Widget> _pages = [
      HomeViews(
        id: _ids,
      ),
      CategoryViews(),
      RecordViews(),
      EmployeesView2(
        id: _ids,
      ),
      SalesViews(),
    ];
    // String mainPages = localizations?.mainPage ?? '';
    bool? color;
    String? langCurrent = widget.currentLocale.languageCode;

    void changeLanguageAndColor(colors, Locale locale) {
      setState(() {
        color = colors;
      });
      widget.changeLanguage(locale);
    }

    return Scaffold(
      key: _scaffoldKey,
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
                _scaffoldKey.currentState!.openEndDrawer();
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
            Container(
              height: 160,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            ),
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
                        '${localizations?.titleName} ${_company?.name}' ??
                            'Default Company Name',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        _company?.owner != null
                            ? '${localizations?.status} ${_company!.owner.enabled ? localizations?.activeStatus : localizations?.notActiveStatus}'
                            : '${localizations?.status} ${localizations?.notActiveStatus}',
                      ),
                    ),
                    ListTile(
                      title: Text(_company?.owner != null
                              ? '${localizations?.youAreTitle} ${Auth.checkRole('OWNER') == "OWNER" ? localizations?.companyOwner : localizations?.employeSingle}'
                              : '${localizations?.numberText} ${localizations?.notText}'
                          // Номер: нету',
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
                    child: Text(
                      localizations?.exit ?? '',
                      // 'Выйти',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
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
            label: 'mainPage',
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

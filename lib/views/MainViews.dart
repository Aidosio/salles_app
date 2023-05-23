import 'package:flutter/material.dart';
import 'package:salles_app/views/CategoryViews.dart';
import 'package:salles_app/views/EmployeesView.dart';
import 'package:salles_app/views/HomeViews.dart';
import 'package:salles_app/views/RecordViews.dart';
import 'package:salles_app/views/SalesViews.dart';

class MainViews extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const MainViews({Key? key, required this.changeLanguage}) : super(key: key);

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

  GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Добавленный ключ Scaffold

  @override
  Widget build(BuildContext context) {
    TextTheme typography = Theme.of(context).textTheme;
    PageController _pageController = PageController(initialPage: 0);
    List<Widget> _pages = [
      HomeViews(),
      CategoryViews(),
      RecordViews(),
      EmployeesView(),
      SalesViews(),
    ];

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
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 8),
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
            icon: Icon(Icons.explore),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Категория',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Оформить',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Сотрудники',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Продажи',
          ),
        ],
      ),
    );
  }
}

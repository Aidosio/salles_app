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
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.amber,
        unselectedItemColor: Colors.black87,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Категория',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Оформление',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Сотрудники',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Продажи',
          ),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(microseconds: 500), curve: Curves.easeInOut);
          });
        },
      ),
    );
  }
}

class Page_HomePage extends StatelessWidget {
  const Page_HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Home");
  }
}

class Account_Page extends StatelessWidget {
  const Account_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Account");
  }
}

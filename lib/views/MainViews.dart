import 'package:flutter/material.dart';

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
    List<Widget> _pages = [Page_HomePage(), Account_Page()];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'категория',
          style: TextStyle(fontSize: typography.headlineMedium?.fontSize),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              icon: Icon(Icons.account_circle_sharp),
              onPressed: () {
                //кнопка на app bar место для действия
              },
            ),
          )
        ],
      ),
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Page 2',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Page 3',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Page 4',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Page 5',
          // ),
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

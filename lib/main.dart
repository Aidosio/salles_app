import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:salles_app/service/Auth.dart';
import 'package:salles_app/views/CategoryChildViews.dart';
import 'package:salles_app/views/ChoiseViews.dart';
import 'package:salles_app/views/EmployeesView.dart';
import 'package:salles_app/views/ExampleViews.dart';
import 'package:salles_app/views/LoginViews.dart';
import 'package:salles_app/views/MainViews.dart';
import 'package:salles_app/views/ProductViews.dart';
import 'package:salles_app/views/RecordCalculateViews.dart';
import 'package:salles_app/views/RecordPurchaseViews.dart';
import 'package:salles_app/views/RecordViews.dart';
import 'package:salles_app/views/SalesRefundAcceptionViews.dart';
import 'package:salles_app/views/SalesRefundViews.dart';
import 'package:salles_app/views/SalesViews.dart';
import 'package:salles_app/views/SalesViews2.dart';
import 'package:salles_app/views/WaitingPage.dart';
import 'package:salles_app/widgets/SplashScreenWidgets.dart';

import 'locale/AppLocalizationsDelegate.dart';
import 'views/ChoiseCompanyViews.dart';
import 'views/CreateCompanyViews.dart';
import 'views/RegisterViews.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _currentLocale = const Locale('es', '');
  AppLocalizationsDelegate _localizationsDelegate = AppLocalizationsDelegate();
  bool _isLoggedIn = false;

  void _changeLanguage(Locale locale) {
    setState(() {
      _currentLocale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeAuth();
  }

  Future<void> _initializeAuth() async {
    bool isLoggedIn = await Auth.isLoggedIn();
    setState(() {
      _isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        _localizationsDelegate,
        ...GlobalMaterialLocalizations.delegates,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', ''),
        Locale('es', ''),
        Locale('en', ''),
      ],
      locale: _currentLocale,
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.lightBlueAccent,
      ),
      home: _isLoggedIn
          ? MainViews(
              changeLanguage: _changeLanguage,
              currentLocale: _currentLocale,
            )
          : LoginViews(
              changeLanguage: _changeLanguage,
              currentLocale: _currentLocale,
            ),
      routes: {
        '/choise': (context) => ChoiseViews(
              changeLanguage: _changeLanguage,
            ),
        '/reg': (context) => RegisterViews(
              changeLanguage: _changeLanguage,
              currentLocale: _currentLocale,
            ),
        '/createCompany': (context) => CreateCompanyViews(
              changeLanguage: _changeLanguage,
            ),
        '/choiseCompany': (context) => ChoiseCompanyViews(
              changeLanguage: _changeLanguage,
            ),
        '/examlpe': (context) => ExampleViews(
              changeLanguage: _changeLanguage,
            ),
        '/waiting': (context) => WaitingPage(
              changeLanguage: _changeLanguage,
            ),
        '/category-views': (context) => CategoryChildViews(),
        '/sales-refund': (context) => SalesRefundViews(),
        '/sales-refund-accept': (context) => SalesRefundAcceptionViews(),
        '/product': (context) => ProductViews(),
        '/sales-views': (context) => SalesViews2(),
        '/record-calculate': (context) => RecordCalculateViews(),
        '/record': (context) => RecordViews(),
      },
    );
  }
}

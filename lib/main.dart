import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:salles_app/views/CategoryChildViews.dart';
import 'package:salles_app/views/ChoiseViews.dart';
import 'package:salles_app/views/EmployeesView.dart';
import 'package:salles_app/views/ExampleViews.dart';
import 'package:salles_app/views/LoginViews.dart';
import 'package:salles_app/views/MainViews.dart';

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
  Locale _currentLocale = const Locale('ru', '');
  AppLocalizationsDelegate _localizationsDelegate = AppLocalizationsDelegate();

  void _changeLanguage(Locale locale) {
    setState(() {
      _currentLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        _localizationsDelegate,
        ...GlobalMaterialLocalizations
            .delegates, // Add the spread operator '...' to unpack the list
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
      // home: LoginViews(
      //   changeLanguage: _changeLanguage,
      // ),
      routes: {
        '/main': (context) => LoginViews(
              changeLanguage: _changeLanguage,
            ),
        '/choise': (context) => ChoiseViews(
              changeLanguage: _changeLanguage,
            ),
        '/reg': (context) => RegisterViews(
              changeLanguage: _changeLanguage,
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
        '/': (context) => MainViews(
              changeLanguage: _changeLanguage,
            ),
        '/category-views': (context) => CategoryChildViews(),
        // '/mainhome': (context) => EmployeesView(),
        // '/sing': (context) => const SingIn(),
        // '/choise': (context) => const ChoicePage(),
        // '/com': (context) => const CompanyCreateStep(),
        // '/reg': (context) => const Register(),
        // '/test': (context) => const Test()
      },
    );
  }
}




// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   final Typography typography = Typography.material2021();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Hello, World!',
//               style: typography.black.headlineSmall,
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.displayLarge,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         icon: Icon(Icons.add),
//         label: Text(
//           'Dobavit',
//           style: typography.black.labelLarge,
//         ),
//       ),
//     );
//   }
// }

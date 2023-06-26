import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../locale/AppLocalizations.dart';

class WaitingPage extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const WaitingPage({
    super.key,
    required this.changeLanguage,
  });

  @override
  State<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(
              //     width: 80,
              //     height: 100,
              //     image: AssetImage('men_on_oclok.png')),
              // SizedBox(
              //   height: 30,
              // ),
              Text(
                localizations?.waitText ?? '',
                // 'Ожидайте',
                style: TextStyle(
                    fontSize: typography.titleLarge?.fontSize,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                localizations?.requestConsideration ?? '',
                // 'Ваш запрос находится на рассмотрении. Мы вас уведомим о завершении проверки информации.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: typography.bodyMedium?.fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

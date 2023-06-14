import 'package:flutter/material.dart';

class WaitingPage extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const WaitingPage({super.key, required this.changeLanguage});

  @override
  State<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text('Ожидайте пока вашу заявку примут'),
      ),
    );
  }
}

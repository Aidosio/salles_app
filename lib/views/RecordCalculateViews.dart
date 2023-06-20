import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../locale/AppLocalizations.dart';

class RecordCalculateViews extends StatefulWidget {
  RecordCalculateViews({
    Key? key,
  }) : super(key: key);

  @override
  State<RecordCalculateViews> createState() => _RecordCalculateViewsState();
}

class _RecordCalculateViewsState extends State<RecordCalculateViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(('Назад'))),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('done_circle.svg'),
              SizedBox(height: 0),
              Text(
                ('Итоговая сумма:'),
                style: TextStyle(
                  fontSize: typography.titleLarge?.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'totalPrice',
                style: TextStyle(
                  fontSize: typography.titleLarge?.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: () {
                    print('id');
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: Text(
                    'Закончить',
                    style: TextStyle(
                        fontSize: typography.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      Size(0, 50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

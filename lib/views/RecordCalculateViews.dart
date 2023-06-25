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
    final arguments = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset('done_circle.svg'),
              SizedBox(height: 0),
              Text(
                localizations?.totalAmount ?? '',
                // 'Итоговая сумма:',
                style: TextStyle(
                  fontSize: typography.titleLarge?.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                arguments,
                style: TextStyle(
                    fontSize: typography.titleLarge?.fontSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade400),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: () {
                    print('id');
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: Text(
                    localizations?.endText ?? '',
                    // 'Закончить',
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

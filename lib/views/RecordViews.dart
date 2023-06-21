import 'package:flutter/material.dart';
import 'package:salles_app/widgets/RecordSalesCardWidgets.dart';

import '../locale/AppLocalizations.dart';

class RecordViews extends StatefulWidget {
  const RecordViews({super.key});

  @override
  State<RecordViews> createState() => _RecordViewsState();
}

class _RecordViewsState extends State<RecordViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 8),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  RecordSalesCardWidgets(
                    idYes: 'yes',
                    idNo: 'no',
                    salesId: '55465464989842132132165464789',
                    id: '1',
                  ),
                  RecordSalesCardWidgets(
                    idYes: 'yes',
                    idNo: 'no',
                    salesId: '5522222222222222266666666664',
                    id: '2',
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 45,
              width: double.infinity,
              child: FloatingActionButton.extended(
                onPressed: () {
                  print('next');
                  Navigator.pushNamed(context, '/record-Purchase');
                },
                label: Text(
                  'Оформить продажу',
                  style: TextStyle(
                      fontSize: typography.bodyMedium?.fontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    final arguments = ModalRoute.of(context)?.settings.arguments as String?;
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 8),
        child: Column(
          children: [
            RecordSalesCardWidgets()
                ? Text('У вас пока нет продаж')
                : Text('data')
          ],
        ),
      ),
    );
  }
}

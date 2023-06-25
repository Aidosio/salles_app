import 'package:flutter/material.dart';
import 'package:salles_app/widgets/IconButtonDialogWidgetsRecord.dart';

import '../locale/AppLocalizations.dart';
import '../views/RecordPurchaseViews.dart';

class RecordSalesCardWidgets extends StatelessWidget {
  final String salesId;
  final String id;
  final String idYes;
  final String idNo;
  final VoidCallback onPressed;
  const RecordSalesCardWidgets({
    Key? key,
    required this.salesId,
    required this.id,
    required this.idNo,
    required this.idYes,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecordPurchaseViews(arguments: id)));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Номер продажи:',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: typography.bodyMedium?.fontSize,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          salesId,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: typography.bodyMedium?.fontSize,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      child: IconButton(
                          onPressed: onPressed,
                          icon: Icon(Icons.delete_outline))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

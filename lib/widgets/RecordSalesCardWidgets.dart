import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class RecordSalesCardWidgets extends StatelessWidget {
  const RecordSalesCardWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as String?;
    final localizations = AppLocalizations.of(context);
    return Container(
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
            Navigator.pushNamed(context, '/');
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text('data'), Text('data2')],
                  ),
                  Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.red.shade200,
                      ),
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.delete_outline)))
                ],
              )
            ],
          )),
    );
  }
}

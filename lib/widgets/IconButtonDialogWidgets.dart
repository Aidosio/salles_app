import 'package:flutter/material.dart';

import '../locale/AppLocalizations.dart';

class IconButtonDialogWidgets extends StatelessWidget {
  final String alertTitle;
  final Icon icon;
  final String idNo;
  final String idYes;
  final Color colorChoice;
  const IconButtonDialogWidgets({
    Key? key,
    required this.idYes,
    required this.idNo,
    required this.alertTitle,
    required this.icon,
    required this.colorChoice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        alignment: Alignment.center,
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: colorChoice,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    backgroundColor: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            alertTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: typography.bodyLarge?.fontSize,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: FilledButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    print(idNo);
                                  },
                                  child: Text("Нет"),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.red.shade400),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                    ),
                                    minimumSize: MaterialStateProperty.all(
                                      Size(0, 40),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: FilledButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    print(idYes);
                                  },
                                  child: Text("Да"),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.green.shade400),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                    ),
                                    minimumSize: MaterialStateProperty.all(
                                      Size(0, 40),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
          icon: icon,
          iconSize: 20,
        ),
      ),
    );
  }
}

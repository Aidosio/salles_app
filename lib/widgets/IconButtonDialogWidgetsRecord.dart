import 'package:flutter/material.dart';
import 'package:salles_app/service/CompanyService.dart';
import 'package:salles_app/service/SalesService.dart';
import 'package:salles_app/service/User.dart';

import '../locale/AppLocalizations.dart';

class IconButtonDialogWidgetsRecord extends StatelessWidget {
  final String alertTitle;
  final Icon icon;
  final String idNo;
  final String idYes;
  final String idCompany;
  final Color colorChoice;
  const IconButtonDialogWidgetsRecord({
    Key? key,
    required this.idYes,
    required this.idCompany,
    required this.idNo,
    required this.alertTitle,
    required this.icon,
    required this.colorChoice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    bool isLoaded = false;

    // _activateUser(String id) async {
    //   try {
    //     await User().activateUser(id);
    //     isLoaded = true;
    //     if (isLoaded) {
    //       Navigator.pop(context);
    //     }
    //     print('yes enabled');
    //   } catch (e) {
    //     print('Error getting company by ID: $e');
    //   }
    // }

    // _disabledUser(String id) async {
    //   try {
    //     await User().disabledUser(id);
    //     isLoaded = true;
    //     if (isLoaded) {
    //       Navigator.pop(context);
    //     }
    //     print('yes disabled');
    //   } catch (e) {
    //     print('Error getting company by ID: $e');
    //   }
    // }

    _deleteSales(String id) async {
      try {
        await SalesService().deleteSales(id);
        isLoaded = true;
        if (isLoaded) {
          Navigator.pop(context);
        }
        print('yes delete');
      } catch (e) {
        print('Error deleting sales by ID: $e');
      }
    }

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
                                  child: Text(
                                    localizations?.notText ?? '',
                                    // "Нет",
                                  ),
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
                                    // if (idNo == 'idNo') {
                                    //   _activateUser(idYes);
                                    // } else {
                                    //   _deleteUser(idCompany, idYes);
                                    // }
                                    _deleteSales(idYes);
                                    // // Navigator.pop(context);
                                    print(idYes);
                                  },
                                  child: Text(
                                    localizations?.yesText ?? '',
                                    // "Да",
                                  ),
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

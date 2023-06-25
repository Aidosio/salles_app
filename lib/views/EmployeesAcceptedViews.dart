import 'package:flutter/material.dart';
import 'package:salles_app/widgets/EmployeesAcceptedWidget.dart';

import '../locale/AppLocalizations.dart';
import '../models/Company.dart';
import '../service/CompanyService.dart';

class EmployeesAcceptedViews extends StatefulWidget {
  final String id;

  const EmployeesAcceptedViews({Key? key, required this.id}) : super(key: key);

  @override
  State<EmployeesAcceptedViews> createState() => _EmployeesAcceptedViewsState();
}

class _EmployeesAcceptedViewsState extends State<EmployeesAcceptedViews> {
  Company? _company;
  bool isLoaded = false;

  _getCompanyByOwnerId(String id) async {
    try {
      Company? company = await CompanyService().getCompanyByOwnerId(id);
      setState(() {
        _company = company;
      });
      isLoaded = true;
      print(_company);
    } catch (e) {
      print('Error getting company by ID: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getCompanyByOwnerId(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 8),
      child: Column(
        children: [
          Visibility(
            visible: isLoaded,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _company?.sellers.length,
              itemBuilder: (context, index) {
                final seller = _company?.sellers[index];

                if (seller?.enabled == true) {
                  // Активный пользователь
                  return EmployeesAcceptedWidget(
                    fullName: '${seller?.lastName} ${seller?.firstName}',
                    phoneNubmer: seller?.phone,
                    id: seller?.id,
                  );
                } else {
                  // Неактивный пользователь
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

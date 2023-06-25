import 'package:flutter/material.dart';
import 'package:salles_app/models/Company.dart';
import 'package:salles_app/service/CompanyService.dart';
import 'package:salles_app/widgets/BlockedRefreshWidgets.dart';
import 'package:salles_app/widgets/EmployeesAcceptedWidget.dart';
import 'package:salles_app/widgets/EmployeesConsiderationWidget.dart';
import 'package:salles_app/widgets/SwipeRefresh.dart';
import '../locale/AppLocalizations.dart';

class EmployeesView extends StatefulWidget {
  final String id;

  const EmployeesView({Key? key, required this.id}) : super(key: key);

  @override
  State<EmployeesView> createState() => _EmployeesViewState();
}

class _EmployeesViewState extends State<EmployeesView> {
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SwipeRefresh(
        onRefresh: () async {
          try {
            Company? company =
                await CompanyService().getCompanyByOwnerId(widget.id);
            setState(() {
              _company = company;
            });
            isLoaded = true;
            print(_company);
            print('обновил');
          } catch (e) {
            print('Error getting company by ID: $e');
          }
        },
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 8),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  localizations?.underConsideration ?? '',
                  // 'На рассмотрении',
                  style: TextStyle(
                    fontSize: typography.bodyMedium?.fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: 5),

              Divider(
                height: 1,
                thickness: 2,
                indent: 0,
                endIndent: 0,
                color: Colors.black,
              ),

              SizedBox(height: 15),

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

                    if (seller?.enabled == false) {
                      // Неактивный пользователь
                      return EmployeesConsiderationWidget(
                          fullName: '${seller?.lastName} ${seller?.firstName}',
                          id: seller?.id,
                          companyId: _company!.id);
                    } else {
                      // Активный пользователь
                      return Container();
                    }
                  },
                ),
              ),
              // EmployeesConsiderationWidget(fullName: 'ФИО', id: '2'),
              // EmployeesConsiderationWidget(fullName: 'ФИО', id: '2'),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  localizations?.employees ?? '',
                  // 'Сотрудники',
                  style: TextStyle(
                    fontSize: typography.bodyMedium?.fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: 5),

              Divider(
                height: 1,
                thickness: 2,
                indent: 0,
                endIndent: 0,
                color: Colors.black,
              ),

              SizedBox(height: 15),

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
              // EmployeesAcceptedWidget(
              //     fullName: 'Арман Газис', phoneNubmer: '877056544', id: '3')
            ],
          ),
        ),
      ),
    );
  }
}

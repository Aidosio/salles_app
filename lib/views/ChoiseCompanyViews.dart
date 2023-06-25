import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:salles_app/models/Company.dart';
import 'package:salles_app/models/CompanyList.dart';
import 'package:salles_app/service/Auth.dart';
import 'package:salles_app/service/CompanyService.dart';
import '../locale/AppLocalizations.dart';

class ChoiseCompanyViews extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const ChoiseCompanyViews({Key? key, required this.changeLanguage})
      : super(key: key);

  @override
  State<ChoiseCompanyViews> createState() => _ChoiseCompanyViewsState();
}

class _ChoiseCompanyViewsState extends State<ChoiseCompanyViews> {
  List<CompanyList>? companyOptions;
  CompanyList? selectedCompany;
  Company? _company;

  _getAllCompany() async {
    try {
      List<CompanyList>? companyList = await CompanyService().getAllCompany();
      setState(() {
        companyOptions = companyList;
      });
      print(companyList);
    } catch (e) {
      print('Error getting company list: $e');
    }
  }

  _onCompanySelectionChanged(CompanyList? newValue) {
    if (newValue != null) {
      _getCompanyById(newValue.name);
      setState(() {
        selectedCompany = newValue;
      });
    }
  }

  _getCompanyById(String name) async {
    try {
      Company? company = await CompanyService().getCompanyByName(name);
      setState(() {
        _company = company;
      });
      print(_company);
    } catch (e) {
      print('Error getting company by ID: $e');
    }
  }

  _updateCompanySellers(String companyId, String sellerId) async {
    try {
      await CompanyService().updateCompanySellers(companyId, sellerId);
      print('Successfully updated company sellers');
    } catch (e) {
      print('Error updating company sellers: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getAllCompany();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;
    final arguments = ModalRoute.of(context)?.settings.arguments as String;

    final decodedToken = JwtDecoder.decode(arguments);
    final _ids = decodedToken['id'];

    print('User ID: $_ids');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localizations?.requestToCompany ?? '',
                // 'Запрос в компанию',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 81, 86, 88),
                  fontSize: typography.headlineMedium?.fontSize,
                ),
              ),
              SizedBox(height: 24),
              DropdownButtonFormField<CompanyList>(
                value: selectedCompany,
                onChanged: _onCompanySelectionChanged,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Категория товара',
                ),
                items: companyOptions?.map<DropdownMenuItem<CompanyList>>(
                  (CompanyList company) {
                    return DropdownMenuItem<CompanyList>(
                      value: company,
                      child: Text(company.name),
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: 30),
              FilledButton.tonal(
                onPressed: () {
                  if (_company != null) {
                    _updateCompanySellers(_company!.id, _ids);
                    // WaitingPage
                    Navigator.pushNamed(context, '/waiting');
                  }
                },
                child: Text("Зарегистрироваться"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  minimumSize:
                      MaterialStateProperty.all(Size(double.infinity, 48)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

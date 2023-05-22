import 'package:flutter/material.dart';
import '../locale/AppLocalizations.dart';

class ChoiseCompanyViews extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const ChoiseCompanyViews({Key? key, required this.changeLanguage})
      : super(key: key);

  @override
  State<ChoiseCompanyViews> createState() => _ChoiseCompanyViewsState();
}

class _ChoiseCompanyViewsState extends State<ChoiseCompanyViews> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    TextTheme typography = Theme.of(context).textTheme;

    String selectedCompany;
    List<String> companyOptions = [
      'Company 1',
      'Company 2',
      'Company 3',
    ];

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
                'Запрос в компанию',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 81, 86, 88),
                  fontSize: typography.headlineMedium?.fontSize,
                ),
              ),
              SizedBox(height: 24),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return companyOptions.where(
                      (option) => option.contains(textEditingValue.text));
                },
                onSelected: (String newValue) {
                  setState(() {
                    selectedCompany = newValue;
                  });
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController textEditingController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    onSubmitted: (value) {
                      onFieldSubmitted();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Название компаний',
                      hintText: 'Название компаний',
                      prefixIcon: Icon(Icons.business),
                    ),
                  );
                },
                optionsViewBuilder: (BuildContext context,
                    AutocompleteOnSelected<String> onSelected,
                    Iterable<String> options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: SizedBox(
                        height: 200.0,
                        child: ListView(
                          padding: EdgeInsets.all(8.0),
                          children: options
                              .map((String option) => GestureDetector(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: ListTile(
                                      title: Text(option),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              FilledButton.tonal(
                onPressed: () {},
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

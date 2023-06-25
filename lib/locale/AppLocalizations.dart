import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  final Map<String, String> _localizedValues;

  AppLocalizations(this.locale, this._localizedValues);

  static Future<AppLocalizations> load(Locale locale) async {
    final Map<String, String> localizedValues =
        await _loadLocalizedValues(locale.languageCode);
    return AppLocalizations(locale, localizedValues);
  }

  static Future<Map<String, String>> _loadLocalizedValues(
      String languageCode) async {
    if (languageCode == 'en') {
      return {
        'title': 'Hello',
        'message': 'Welcome to my app!',
        'enterTitle': 'enter',
        'areYouHow': '',
        'phoneNumber': 'Номер телефона',
        'youHaveNoSales': 'youHaveNoSales',
        'lastSales': 'lastSales',
        'lastAddedProducts': 'lastAddedProducts',
        'addNewProduct': 'addNewProduct',
        'makeASale': 'makeASale',
        'underConsideration': 'underConsideration',
        'dontProductsInCategory': 'dontProductsInCategory',
        'requestToCompany': 'requestToCompany',
        'companyOwner': 'companyOwner',
        'seller': 'seller',
        'companyRegistration': 'companyRegistration',
        'companyName': 'companyName',
        'registerTitle': 'registerTitle',
        'employees': 'employees',
        'password': 'password',
        'enter': 'enter',
        'mainPage': 'mainPage',
        'exit': 'exit',
        'categoryPage': 'categoryPage',
        'recordPage': 'recordPage',
        'salesPage': 'salesPage',
        'backWards': 'backWards',
        'productName': 'productName',
        'productPrice': 'productPrice',
        'quantityGoods': 'quantityGoods',
        'productCategory': 'productCategory',
        'titleName': 'titleName',
        'status': 'status',
        'activeStatus': 'activeStatus',
        'notActiveStatus': 'notActiveStatus',
        'youAreTitle': 'youAreTitle',
        'numberText': 'numberText',
        'notText': 'notText',
        'pieces': 'pieces',
        'add': 'add',
        'endText': 'endText',
        'totalAmount': 'totalAmount',
        'noProductsAvailable': 'noProductsAvailable',
        'registrationPage': 'registrationPage',
        'errorNumberAndPassword': 'errorNumberAndPassword',
        'errorPassword': 'errorPassword',
        'errorNumber': 'errorNumber',
        'authorizationError': 'authorizationError',
        'errorEnteringName': 'errorEnteringName',
        'errorEnteringLastName': 'errorEnteringLastName',
        'errorEnteringPhoneNumber': 'errorEnteringPhoneNumber',
        'errorEnteringPassword': 'errorEnteringPassword',
        'personFirstName': 'personName',
        'personSecondName': 'personSecondName',
      };
    } else if (languageCode == 'ru') {
      return {
        'title': 'Привет',
        'message': 'Добро пожаловать в мое приложение',
        'enterTitle': 'Вход',
        'areYouHow': 'Вы являетесь',
        'phoneNumber': 'Номер телефона',
        'youHaveNoSales': 'У вас нет продаж',
        'lastSales': 'Последние продажи',
        'lastAddedProducts': 'Последние добавленные товары',
        'addNewProduct': 'Добавить товар',
        'makeASale': 'Оформить продажу',
        'underConsideration': 'На рассмотрении',
        'dontProductsInCategory': 'У вас пока нету товаров в этой категории',
        'requestToCompany': 'Запрос в компанию',
        'companyOwner': 'Владелец компании',
        'seller': 'Продавец',
        'companyRegistration': 'Регистрация компании',
        'companyName': 'Название компании',
        'registerTitle': 'Зарегистрироваться',
        'employees': 'Сотрудники',
        'password': 'Пароль',
        'enter': 'Войти',
        'mainPage': 'Главная',
        'exit': 'Выйти',
        'categoryPage': 'Категория',
        'recordPage': 'Сотрудники',
        'salesPage': 'Продажи',
        'backWards': 'Назад',
        'productName': 'Название товара',
        'productPrice': 'Цена товара',
        'quantityGoods': 'Количество',
        'productCategory': 'Категория товара',
        'titleName': 'Название:',
        'status': 'Статус:',
        'activeStatus': 'Активен',
        'notActiveStatus': 'Не активен',
        'youAreTitle': 'Вы:',
        'numberText': 'Номер:',
        'notText': 'Нет',
        'employeSingle': 'Сотрудник',
        'pieces': 'шт',
        'add': 'Добавить',
        'endText': 'Закончить',
        'totalAmount': 'Итоговая сумма:',
        'noProductsAvailable': 'Нет доступных продуктов',
        'registrationPage': 'Регистрация',
        'errorNumberAndPassword': 'Ошибка: Введите номер телефона и пароль',
        'errorPassword': 'Ошибка: Введите пароль',
        'errorNumber': 'Ошибка: Введите номер телефона',
        'authorizationError': 'Ошибка авторизации',
        'errorEnteringName': "Ошибка при вводе имени: 'Ошибка: Введите имя'.",
        'errorEnteringLastName':
            "Ошибка при вводе фамилии: 'Ошибка: Введите фамилию'.",
        'errorEnteringPhoneNumber':
            "Ошибка при вводе номера телефона: 'Ошибка: Введите номер телефона'.",
        'errorEnteringPassword':
            "Ошибка при вводе пароля: 'Ошибка: Введите пароль'.",
        'personFirstName': 'Имя',
        'personSecondName': 'Фамилия',
      };
    } else if (languageCode == 'es') {
      return {
        'title': 'Сәлем',
        'message': 'Менің қосымшама қош келдіңіз',
        'enterTitle': 'Кiру',
        'areYouHow': 'Сіз',
        'phoneNumber': 'Телефон нөмірі',
        'youHaveNoSales': 'Сізде сатылым жоқ',
        'lastSales': 'Соңғы сатылымдар',
        'lastAddedProducts': 'Соңғы қосылған тауарлар',
        'addNewProduct': 'Тауар қосу',
        'makeASale': 'Сатуды рәсімдеу',
        'underConsideration': 'Қарауда',
        'dontProductsInCategory': 'Сізде бұл санатта тауарлар жоқ',
        'requestToCompany': 'Компанияға сұрау жіберу',
        'companyOwner': 'Компания иесі',
        'seller': 'Сатушы',
        'companyRegistration': 'Компанияны тіркеу',
        'companyName': 'Компанияның атауы',
        'registerTitle': 'Тіркелу',
        'employees': 'Қызметкерлер',
        'password': 'Құпия сөз',
        'enter': 'Кiру',
        'mainPage': 'Басты бет',
        'exit': 'Шығу',
        'categoryPage': 'Санат',
        'recordPage': 'Рәсімдеу',
        'salesPage': 'Сату',
        'backWards': 'Кері қайту',
        'productName': 'Тауардың атауы',
        'productPrice': 'Тауардың бағасы',
        'quantityGoods': 'Cаны',
        'productCategory': 'Тауар санаты',
        'titleName': 'Атауы:',
        'status': 'Мәртебесі:',
        'activeStatus': 'Белсенді',
        'notActiveStatus': 'Белсенді емес',
        'youAreTitle': 'Сіз:',
        'numberText': 'Нөмірі:',
        'notText': 'Жоқ',
        'employeSingle': 'Қызметкерсіз',
        'pieces': 'дана',
        'add': 'Қосу',
        'endText': 'Бітіру',
        'totalAmount': 'Қорытынды сома:',
        'noProductsAvailable': 'Қол жетімді өнім жоқ',
        'registrationPage': 'Тіркеу',
        'errorNumberAndPassword':
            'Қате: Телефон нөмірі мен құпия сөзді енгізіңіз',
        'errorPassword': 'Қате: Құпия сөзді енгізіңіз',
        'errorNumber': 'Қате: Телефон нөмірің енгізіңіз',
        'authorizationError': 'Авторизация кезінде қате',
        'errorEnteringName':
            "Есімді енгізу кезінде қате: 'Қате: есімді енгізіңіз'.",
        'errorEnteringLastName':
            "Фамилияны енгізу кезіндегі қате: 'Қате: Фамилияны енгізіңіз'.",
        'errorEnteringPhoneNumber':
            "Телефон нөмірін енгізудегі қате: 'Қате: Телефон нөмірін енгізіңіз'.",
        'errorEnteringPassword':
            "Құпия сөзді енгізу қатесі: 'Қате: Құпия сөзді енгізіңіз'.",
        'personFirstName': 'Аты',
        'personSecondName': 'Тегі',
      };
    }

    // Возвращаем пустой Map, если ресурсы для выбранного языка не найдены
    return {};
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String? get title {
    return _localizedValues['title'];
  }

  String? get message {
    return _localizedValues['message'];
  }

  String? get enterTitle {
    return _localizedValues['enterTitle'];
  }

  String? get areYouHow {
    return _localizedValues['areYouHow'];
  }

  String? get phoneNumber {
    return _localizedValues['phoneNumber'];
  }

  String? get youHaveNoSales {
    return _localizedValues['youHaveNoSales'];
  }

  String? get lastSales {
    return _localizedValues['lastSales'];
  }

  String? get lastAddedProducts {
    return _localizedValues['lastAddedProducts'];
  }

  String? get addNewProduct {
    return _localizedValues['addNewProduct'];
  }

  String? get makeASale {
    return _localizedValues['makeASale'];
  }

  String? get underConsideration {
    return _localizedValues['underConsideration'];
  }

  String? get dontProductsInCategory {
    return _localizedValues['dontProductsInCategory'];
  }

  String? get requestToCompany {
    return _localizedValues['requestToCompany'];
  }

  String? get companyOwner {
    return _localizedValues['companyOwner'];
  }

  String? get seller {
    return _localizedValues['seller'];
  }

  String? get companyRegistration {
    return _localizedValues['companyRegistration'];
  }

  String? get companyName {
    return _localizedValues['companyName'];
  }

  String? get registerTitle {
    return _localizedValues['registerTitle'];
  }

  String? get employees {
    return _localizedValues['employees'];
  }

  String? get password {
    return _localizedValues['password'];
  }

  String? get enter {
    return _localizedValues['enter'];
  }

  String? get mainPage {
    return _localizedValues['mainPage'];
  }

  String? get exit {
    return _localizedValues['exit'];
  }

  String? get categoryPage {
    return _localizedValues['categoryPage'];
  }

  String? get recordPage {
    return _localizedValues['recordPage'];
  }

  String? get employeesPage {
    return _localizedValues['employeesPage'];
  }

  String? get salesPage {
    return _localizedValues['salesPage'];
  }

  String? get backWards {
    return _localizedValues['backWards'];
  }

  String? get productName {
    return _localizedValues['productName'];
  }

  String? get productPrice {
    return _localizedValues['productPrice'];
  }

  String? get quantityGoods {
    return _localizedValues['quantityGoods'];
  }

  String? get productCategory {
    return _localizedValues['productCategory'];
  }

  String? get titleName {
    return _localizedValues['titleName'];
  }

  String? get status {
    return _localizedValues['status'];
  }

  String? get activeStatus {
    return _localizedValues['activeStatus'];
  }

  String? get notActiveStatus {
    return _localizedValues['notActiveStatus'];
  }

  String? get youAreTitle {
    return _localizedValues['youAreTitle'];
  }

  String? get numberText {
    return _localizedValues['numberText'];
  }

  String? get notText {
    return _localizedValues['notText'];
  }

  String? get employeSingle {
    return _localizedValues['employeSingle'];
  }

  String? get pieces {
    return _localizedValues['pieces'];
  }

  String? get add {
    return _localizedValues['add'];
  }

  String? get endText {
    return _localizedValues['endText'];
  }

  String? get totalAmount {
    return _localizedValues['totalAmount'];
  }

  String? get noProductsAvailable {
    return _localizedValues['noProductsAvailable'];
  }

  String? get registrationPage {
    return _localizedValues['registrationPage'];
  }

  String? get errorNumberAndPassword {
    return _localizedValues['errorNumberAndPassword'];
  }

  String? get errorPassword {
    return _localizedValues['errorPassword'];
  }

  String? get errorNumber {
    return _localizedValues['errorNumber'];
  }

  String? get authorizationError {
    return _localizedValues['authorizationError'];
  }

  String? get errorEnteringName {
    return _localizedValues['errorEnteringName'];
  }

  String? get errorEnteringLastName {
    return _localizedValues['errorEnteringLastName'];
  }

  String? get errorEnteringPhoneNumber {
    return _localizedValues['errorEnteringPhoneNumber'];
  }

  String? get errorEnteringPassword {
    return _localizedValues['errorEnteringPassword'];
  }

  String? get personFirstName {
    return _localizedValues['errorEnteringPassword'];
  }

  String? get personSecondName {
    return _localizedValues['errorEnteringPassword'];
  }
}

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
        'enter': 'enter',
        'areYouHow': '',
        'phoneNumber': 'Номер',
        'youHaveNoSales': 'youHaveNoSales',
        'lastSales': 'lastSales',
        'lastAddedProducts': 'lastAddedProducts',
        'addNewProduct': 'addNewProduct',
        'makeASale': 'makeASale',
        'underConsideration': 'underConsideration',
      };
    } else if (languageCode == 'ru') {
      return {
        'title': 'Привет',
        'message': 'Добро пожаловать в мое приложение',
        'enter': 'Вход',
        'areYouHow': 'Вы являетесь',
        'phoneNumber': 'Номер',
        'youHaveNoSales': 'У вас нет продаж',
        'lastSales': 'Последние продажи',
        'lastAddedProducts': 'Последние добавленные товары',
        'addNewProduct': 'Добавить товар',
        'makeASale': 'Оформить продажу',
        'underConsideration': 'На рассмотрении',
      };
    } else if (languageCode == 'es') {
      return {
        'title': 'Сәлем',
        'message': 'Менің қосымшама қош келдіңіз',
        'enter': 'Кiру',
        'areYouHow': 'Сіз',
        'phoneNumber': 'Нөмірі',
        'youHaveNoSales': 'Сізде сатылым жоқ',
        'lastSales': 'Соңғы сатылымдар',
        'lastAddedProducts': 'Соңғы қосылған тауарлар',
        'addNewProduct': 'Тауар қосу',
        'makeASale': 'Сатуды рәсімдеу',
        'underConsideration': 'Қарауда',
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

  String? get enter {
    return _localizedValues['enter'];
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

  String? get phoneNumber2 {
    return _localizedValues['phoneNumber2'];
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
}

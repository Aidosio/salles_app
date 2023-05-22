import 'package:flutter/material.dart';

import 'AppLocalizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = await AppLocalizations.load(locale);
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) {
    return false;
  }
}

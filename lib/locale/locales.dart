import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/config/app_config.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String? getTranslationOf(String key) {
    return AppConfig.languagesSupported[locale.languageCode]!.values[key] != null
        ? AppConfig.languagesSupported[locale.languageCode]!.values[key]
        : AppConfig.languagesSupported[AppConfig.languageDefault]!.values[key] !=
                null
            ? AppConfig
                .languagesSupported[AppConfig.languageDefault]!.values[key]
            : "";
  }

  static List<Locale> getSupportedLocales() {
    List<Locale> toReturn = [];
    for (String langCode in AppConfig.languagesSupported.keys)
      toReturn.add(Locale(langCode));
    return toReturn;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppConfig.languagesSupported.keys.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

extension StateExtension on State {
  String? getTranslationOf(String key) {
    return context.getTranslationOf(key);
  }
}

extension ContextExtension on BuildContext {
  String? getTranslationOf(String key) {
    return AppLocalizations.of(this)!.getTranslationOf(key);
  }
}

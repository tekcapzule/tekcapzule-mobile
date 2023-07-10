import 'package:tek_capsule/core/locale/languages/english.dart';


class AppConfig {
  static final String appName = 'Tek Capsule';
  static final String packageName = 'com.flutter.tek_capsule';
  static final String languageDefault = "en";
  static final Map<String, AppLanguage> languagesSupported = {
    'en': AppLanguage("English", english()),
  };
  static final bool isDemoMode = true;
}

class AppLanguage {
  final String name;
  final Map<String, String> values;
  AppLanguage(this.name, this.values);
}

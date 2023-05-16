import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:tek_capsule/features/auth/sign_in/login_ui.dart';
import 'package:tek_capsule/business_logic/widget/root_injector_widget.dart';
import 'package:tek_capsule/infrastructure/network/http_client/http_client_override.dart';
import 'package:tek_capsule/core/locale/language_cubit.dart';
import 'package:tek_capsule/core/locale/language_ui.dart';
import 'package:tek_capsule/core/locale/locales.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/core/themes/theme_cubit.dart';
import 'package:tek_capsule/core/themes/styles.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = HttpClientOverride();
  // final prefs = await SharedPreferences.getInstance();
  // bool? isDark = prefs.getBool('theme');
  // runApp(MultiBlocProvider(providers: [
  //   // BlocProvider(create: (context) => LanguageCubit()),
  //   BlocProvider(create: (context) => ThemeCubit(true)),
  // ], child: Phoenix(child: MyApp())));
  final injectorWidget = RootInjectorWidget(
      child: MultiBlocProvider(providers: [
    BlocProvider(create: (context) => LanguageCubit()),
    BlocProvider(create: (context) => ThemeCubit(true)),
  ], child: Phoenix(child: MyApp())));
  injectorWidget.init();
  runApp(injectorWidget);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: appTheme,
      home: SignInUI(),
      routes: PageRoutes().routes(),
    );
  }
}

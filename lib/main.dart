import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tek_capsule/common/utility/local_store.dart';
import 'package:tek_capsule/features/auth/sign_in/login_ui.dart';
import 'package:tek_capsule/business_logic/widget/root_injector_widget.dart';
import 'package:tek_capsule/infrastructure/network/http_client/http_client_override.dart';
import 'package:tek_capsule/core/locale/locales.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/core/themes/styles.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = HttpClientOverride();
  final GlobalKey<ScaffoldMessengerState> globalscaffoldKey =
      new GlobalKey<ScaffoldMessengerState>();
  final injectorWidget = RootInjectorWidget(child: MyApp(globalscaffoldKey));
  injectorWidget.init(globalscaffoldKey);
  LocalStore().init();
  runApp(injectorWidget);
}

class MyApp extends StatefulWidget {
  final GlobalKey<ScaffoldMessengerState> globalscaffoldKey;
  MyApp(this.globalscaffoldKey) {
    // GlobalKey<ScaffoldMessengerState> scaffoldKey
    // this.globalscaffoldKey = scaffoldKey;
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    RootInjectorWidget.of(context)?.applicationBloc.dispose();
    LocalStore().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: widget.globalscaffoldKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
      ],
      locale: Locale('en'),
      theme: appTheme,
      home: SignInUI(),
      routes: PageRoutes().routes(),
    );
  }
}

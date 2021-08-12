import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:tek_capsule/auth/sign_in/login_ui.dart';
import 'package:tek_capsule/language_cubit.dart';
import 'package:tek_capsule/locale/language_ui.dart';
import 'package:tek_capsule/locale/locales.dart';
import 'package:tek_capsule/routes/routes.dart';
import 'package:tek_capsule/theme_cubit.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  // final prefs = await SharedPreferences.getInstance();
  // bool? isDark = prefs.getBool('theme');
  runApp(MultiBlocProvider(providers: [
    // BlocProvider(create: (context) => LanguageCubit()),
    BlocProvider(create: (context) => ThemeCubit(true)),
  ], child: Phoenix(child: MyApp())));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: theme,
            home: SignInUI(),
            routes: PageRoutes().routes(),
          );
      },
    );
  }
}

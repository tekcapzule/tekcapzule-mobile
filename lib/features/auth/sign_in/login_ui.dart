import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/business_logic/application_bloc.dart';
import 'package:tek_capsule/business_logic/widget/root_injector_widget.dart';
import 'package:tek_capsule/widgets/action_indicator.dart';
import 'package:tek_capsule/widgets/custom_button.dart';
import 'package:tek_capsule/widgets/entry_field.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/core/locale/locales.dart';
import 'package:tek_capsule/infrastructure/service/auth_service/auth_service.dart';

class SignInUI extends StatefulWidget {
  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  _SignInUIState();
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(
  //       Duration(seconds: 6), () => BuyThisApp.showSubscribeDialog(context));
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => configureAwsCognito());
  }

  Future<void> configureAwsCognito() async {
    try {
      final authService = await AuthenticationService.init();
      RootInjectorWidget.of(context)!.authService = authService;
      await authService.signOutUser();
    } on Exception catch (e) {
      safePrint('An error occurred while configuring Amplify: $e');
    }
  }

  @override
  void dispose() {
    emailInputController.dispose();
    passwordInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        Column(
          children: [
            Container(
              color: theme.focusColor,
              child: Container(
                  margin: EdgeInsets.all(16.0),
                  child: Image.asset("assets/logo_main.png")),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 25.0),
                        child: Text(getTranslationOf('sign_in_now')!,
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      EntryField(
                        label: getTranslationOf('email'),
                        hint: getTranslationOf('enter_email'),
                        textController: emailInputController,
                        hideText: false,
                      ),
                      EntryField(
                        label: getTranslationOf('password'),
                        hint: getTranslationOf('enter_password'),
                        textController: passwordInputController,
                        hideText: true,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, PageRoutes.signUp);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Text(
                            'New User?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      CustomButton(
                        textColor: Theme.of(context).colorScheme.background,
                        onTap: () async {
                          final config =
                              await ApplicationBloc.getAppConfiguration('dev');
                          if (config.features!.awsCognito!) {
                            final result = RootInjectorWidget.of(context)!
                                .authService
                                .signInUser(emailInputController.text,
                                    passwordInputController.text);
                            result!.then((value) => {
                                  if (value.isSignedIn)
                                    {
                                      Navigator.pushNamed(
                                          context, PageRoutes.news)
                                    }
                                  else
                                    {
                                      AlertDialog(
                                        title: Text("TekCapsule Alert"),
                                        content:
                                            Text("User Not Authenticated."),
                                      ),
                                      emailInputController.clear(),
                                      passwordInputController.clear(),
                                    }
                                });
                          } else {
                            Navigator.pushNamed(context, PageRoutes.news);
                          }
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(getTranslationOf('or_continue_with')!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        text: 'Facebook',
                        hasBorder: true,
                        textColor: Theme.of(context).primaryColor,
                        onTap: () {
                          // Navigator.pushNamed(context, PageRoutes.signUp);
                          final scaffoldkey = RootInjectorWidget.of(context)!
                              .applicationBloc
                              .globalscaffoldKey;
                          final scaffoldState = scaffoldkey.currentState;
                          if (scaffoldState != null) {
                            scaffoldState.showSnackBar(ActionIndicator().getSnackBar(
                                context, 'A feature in progress!.'));
                          }
                        },
                      ),
                      CustomButton(
                        text: 'Google',
                        hasBorder: true,
                        textColor: Theme.of(context).primaryColor,
                        onTap: () {
                          // Navigator.pushNamed(context, PageRoutes.signUp);
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     getSnackBar(context, 'A feature in progress!.'));
                          ActionIndicator().getDialog(context, "Alert", "Saved Successfully!");
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  Future<AlertDialog?> getDialog(
      BuildContext context, String title, String message) {
    return showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 63, 61, 62),fontSize: 20),
            content: Text(message, style: TextStyle(fontWeight: FontWeight.normal),),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          );
        });
  }

  TextButton socialButton(String icon, String text) {
    return TextButton.icon(
      icon: ImageIcon(
        AssetImage(icon),
        color: Theme.of(context).colorScheme.background,
        size: 20,
      ),
      onPressed: () {},
      label: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.background),
      ),
    );
  }

  SnackBar getSnackBar(BuildContext context, String message) {
    return SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      elevation: 15,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color.fromARGB(255, 83, 78, 78),
      action: SnackBarAction(
          textColor: Color.fromARGB(255, 252, 137, 137),
          label: 'Dismiss',
          onPressed: (() {
            ScaffoldMessenger.of(context).clearSnackBars();
          })),
    );
  }
}

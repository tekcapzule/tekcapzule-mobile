import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/bloc/widget/root_injector_widget.dart';
import 'package:tek_capsule/components/custom_button.dart';
import 'package:tek_capsule/components/entry_field.dart';
import 'package:tek_capsule/config/cognito_configurations.dart';
import 'package:tek_capsule/routes/routes.dart';
import 'package:tek_capsule/locale/locales.dart';
import 'package:tek_capsule/infrastructure/service/auth_service/auth_service.dart';

class SignInUI extends StatefulWidget {
  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();
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
                            style: Theme.of(context).textTheme.subtitle1),
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
                        textColor: Theme.of(context).backgroundColor,
                        onTap: () {
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
                                      content: Text("User Not Authenticated."),
                                    ),
                                    emailInputController.clear(),
                                    passwordInputController.clear(),
                                  }
                              });
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(getTranslationOf('or_continue_with')!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        text: 'Facebook',
                        hasBorder: true,
                        textColor: Theme.of(context).primaryColor,
                        onTap: () {
                          Navigator.pushNamed(context, PageRoutes.signUp);
                        },
                      ),
                      CustomButton(
                        text: 'Google',
                        hasBorder: true,
                        textColor: Theme.of(context).primaryColor,
                        onTap: () {
                          Navigator.pushNamed(context, PageRoutes.signUp);
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

  TextButton socialButton(String icon, String text) {
    return TextButton.icon(
      icon: ImageIcon(
        AssetImage(icon),
        color: Theme.of(context).backgroundColor,
        size: 20,
      ),
      onPressed: () {},
      label: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Theme.of(context).backgroundColor),
      ),
    );
  }
}

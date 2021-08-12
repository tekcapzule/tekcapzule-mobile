import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/components/custom_button.dart';
import 'package:tek_capsule/components/entry_field.dart';
import 'package:tek_capsule/routes/routes.dart';
import 'package:tek_capsule/locale/locales.dart';

class SignInUI extends StatefulWidget {
  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(
  //       Duration(seconds: 6), () => BuyThisApp.showSubscribeDialog(context));
  // }

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
              child: Image.asset("assets/logo_main.png")),),              
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
                          Padding(padding: EdgeInsets.only(left: 15.0, top: 25.0),
                          child: Text(getTranslationOf('sign_in_now')!,
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.subtitle1),),
                        
                          EntryField(
                            label: getTranslationOf('phone_number'),
                            hint: getTranslationOf('enter_phone_number'),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomButton(
                            textColor: Theme.of(context).backgroundColor,
                            onTap: () {
                              Navigator.pushNamed(context, PageRoutes.signUp);
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

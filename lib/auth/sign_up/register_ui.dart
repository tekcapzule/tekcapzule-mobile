import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/components/custom_button.dart';
import 'package:tek_capsule/components/entry_field.dart';
import 'package:tek_capsule/routes/routes.dart';
import 'package:tek_capsule/locale/locales.dart';

class RegisterUI extends StatefulWidget {
  @override
  _RegisterUIState createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FadedSlideAnimation(
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: theme.focusColor,
          shadowColor: theme.focusColor,
          foregroundColor: theme.focusColor,
          elevation: 0.0,
          bottomOpacity: 0.0,
          iconTheme: IconThemeData(color: theme.primaryColor),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: Container(
                child: Image.asset("assets/vct_register.png")),
            ),
            SizedBox(
              height: 1,
              child: Center(
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: 2,
                  color: Color(0xffE2E2E2),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.68,
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: theme.backgroundColor,
                ),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, bottom: 10),
                          child: Text(
                            getTranslationOf('register')!,
                            style: theme.textTheme.subtitle1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            getTranslationOf('in_less_than')!,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.subtitle2,
                          ),
                        ),
                      ],
                    ),
                    EntryField(
                      label: getTranslationOf('full_name'),
                      hint: getTranslationOf('enter_full_name'),
                    ),
                    EntryField(
                      label: getTranslationOf('email_address'),
                      hint: getTranslationOf('enter_email_address'),
                    ),
                    EntryField(
                      label: getTranslationOf('phone_number'),
                      hint: getTranslationOf('enter_phone_number'),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        getTranslationOf('we_will_send')!,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.subtitle1,
                      ),
                    ),
                    CustomButton(
                      textColor: Theme.of(context).backgroundColor,
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.verification);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      beginOffset: Offset(0, 0.3),
      endOffset: Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
    );
  }
}

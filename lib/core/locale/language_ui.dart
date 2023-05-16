import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tek_capsule/widgets/custom_button.dart';
import 'package:tek_capsule/common/config/app_config.dart';
import 'package:tek_capsule/core/locale/language_cubit.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/core/locale/locales.dart';

class LanguageUI extends StatefulWidget {
  @override
  _LanguageUIState createState() => _LanguageUIState();
}

class _LanguageUIState extends State<LanguageUI> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              AppBar(
                iconTheme: IconThemeData(color: theme.focusColor),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(getTranslationOf('language')!,
                            style: theme.textTheme.headline6),
                        Text(
                          getTranslationOf('preferred_language')!,
                          style: theme.textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  FadedScaleAnimation(
                    Image.asset(
                      "assets/vct_language.png",
                      scale: 3,
                    ),
                    durationInMilliseconds: 600,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                  height: MediaQuery.of(context).size.height * 0.72,
                  decoration: BoxDecoration(
                      color: theme.backgroundColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Text(
                          getTranslationOf('select_preferred_language')!,
                          style: theme.textTheme.subtitle2!.copyWith(
                            color: theme.focusColor,
                          ),
                        ),
                      ),
                      BlocBuilder<LanguageCubit, Locale>(
                        builder: (context, state) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: AppConfig.languagesSupported.length,
                            itemBuilder: (context, index) => RadioListTile(
                              activeColor: Theme.of(context).primaryColor,
                              onChanged: (dynamic value) {
                                print(value);
                                BlocProvider.of<LanguageCubit>(context)
                                    .setCurrentLanguage(value as String);
                              },
                              groupValue: state.languageCode,
                              value: AppConfig.languagesSupported.keys
                                  .elementAt(index),
                              title: Text(
                                AppConfig
                                    .languagesSupported[AppConfig
                                        .languagesSupported.keys
                                        .elementAt(index)]!
                                    .name,
                                style: theme.textTheme.headline6!.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      CustomButton(
                        text: getTranslationOf('submit'),
                        onTap: () {
                          Navigator.pushNamed(context, PageRoutes.signIn);
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
      ),
    );
  }
}

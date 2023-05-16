import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/core/themes/colors.dart';
import 'package:tek_capsule/core/locale/locales.dart';

class FullNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 8, left: 16, right: 16),
            color: Colors.black,
            child: Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left_sharp,
                      color: theme.backgroundColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Spacer(),
                Text(
                  'www.thetimesexpress.com',
                  style: theme.textTheme.caption!.copyWith(
                    color: whiteTextColor,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.more_vert,
                  color: whiteTextColor,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(12),
            color: theme.primaryColor,
            child: FadedScaleAnimation(
              Image.asset(
                'assets/newstitle.png',
                scale: 2.5,
              ),
            ),
          ),
          Text(
            context.getTranslationOf('latest_news_or_sports')!.padLeft(26),
            style: theme.textTheme.caption,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FadedScaleAnimation(
              Text(
                context.getTranslationOf('news_headline')!,
                style: theme.textTheme.headline6!.copyWith(
                    fontSize: 28,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Image.asset('assets/new_feature_image/news1.png'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
                text: TextSpan(
                    text: context.getTranslationOf('by')! + ' ',
                    style: theme.textTheme.caption,
                    children: [
                  TextSpan(
                      text: 'Linda Anderson',
                      style: theme.textTheme.caption!.copyWith(
                        color: theme.primaryColor,
                      )),
                ])),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              context.getTranslationOf('news_description')!,
              style: theme.textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

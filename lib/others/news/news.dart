import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/components/news_component.dart';
import 'package:tek_capsule/components/swipe_detector.dart';
import 'package:tek_capsule/others/news/full_news.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    String title =
        ModalRoute.of(context)!.settings.arguments as String? ?? "My Feed";

    return SwipeDetector(
      onSwipeLeft: () => Navigator.push(
          context, CupertinoPageRoute(builder: (context) => FullNews())),
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: theme.backgroundColor,
            body: NewsComponent(true, true, title),
          ),
          // PositionedDirectional(
          //     bottom: 100,
          //     end: 30,
          //     child: Image.asset(
          //       'assets/ic_swipeleft.png',
          //       scale: 2,
          //     )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tek_capsule/widgets/news_component.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    String title =
        ModalRoute.of(context)!.settings.arguments as String? ?? "My Feed";

    return Stack(
      children: [
        Scaffold(
          backgroundColor: theme.colorScheme.background,
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
    );
  }
}

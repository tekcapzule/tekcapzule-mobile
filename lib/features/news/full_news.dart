import 'package:flutter/material.dart';
import 'package:tek_capsule/core/themes/colors.dart';
import 'package:tek_capsule/widgets/web_view.dart';

class FullNews extends StatefulWidget {
  final String url;
  final String title;

  FullNews(this.url, this.title);

  @override
  State<FullNews> createState() => _FullNewsState(url, title);
}

class _FullNewsState extends State<FullNews> {
  final String url;
  final String title;

  _FullNewsState(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Container(
        padding: EdgeInsets.only(top: 40, bottom: 20, left: 5, right: 10),
            color: Colors.black,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left_sharp,
                          color: theme.colorScheme.background,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Spacer(),
                    Center(
                      child: Text(
                        title,
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: whiteTextColor,
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.more_vert,
                      color: whiteTextColor,
                    ),
              ],
            ),
            Expanded(child: WebView(url, title))
          ],
        ),
      ),
    );
  }
}

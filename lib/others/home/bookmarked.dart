import 'package:flutter/material.dart';
import 'package:tek_capsule/components/news_component.dart';
import 'package:tek_capsule/locale/locales.dart';

class Bookmarked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            NewsComponent(true, true, context.getTranslationOf('bookmarked')));
  }
}

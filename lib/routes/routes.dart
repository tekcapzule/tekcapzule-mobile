import 'package:flutter/material.dart';
import 'package:tek_capsule/auth/sign_in/login_ui.dart';
import 'package:tek_capsule/auth/sign_up/register_ui.dart';
import 'package:tek_capsule/auth/verification/verification_ui.dart';
import 'package:tek_capsule/locale/language_ui.dart';
import 'package:tek_capsule/others/home/about_us.dart';
import 'package:tek_capsule/others/home/bookmarked.dart';
import 'package:tek_capsule/others/home/faqs.dart';
import 'package:tek_capsule/others/home/my_profile.dart';
import 'package:tek_capsule/others/home/preferences.dart';
import 'package:tek_capsule/others/home/privacy_policy.dart';
import 'package:tek_capsule/others/home/support.dart';
import 'package:tek_capsule/others/news/comment.dart';
import 'package:tek_capsule/others/news/full_news.dart';
import 'package:tek_capsule/others/news/news.dart';

class PageRoutes {
  static const String signIn = "signIn";
  static const String signUp = "signUp";
  static const String verification = "verification";
  static const String news = "news";
  static const String fullNews = "fullNews";
  static const String comment = "comment";
  static const String support = "support";
  static const String privacyPolicy = "privacyPolicy";
  static const String preferences = "preferences";
  static const String myProfile = "myProfile";
  static const String faqs = "faqs";
  static const String bookmarked = "bookmarked";
  static const String aboutUs = "aboutUs";
  static const String language = "language";

  Map<String, WidgetBuilder> routes() {
    return {
      signIn: (context) => SignInUI(),
      signUp: (context) => RegisterUI(),
      verification: (context) => VerificationUI(),
      news: (context) => News(),
      fullNews: (context) => FullNews(),
      comment: (context) => Comment(),
      support: (context) => Support(),
      privacyPolicy: (context) => PrivacyPolicy(),
      preferences: (context) => Preferences(),
      myProfile: (context) => MyProfile(),
      faqs: (context) => Faqs(),
      bookmarked: (context) => Bookmarked(),
      aboutUs: (context) => AboutUs(),
      language: (context) => LanguageUI(),
    };
  }
}

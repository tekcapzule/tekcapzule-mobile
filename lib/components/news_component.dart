import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/components/app_drawer.dart';
import 'package:tek_capsule/routes/routes.dart';
import 'package:tek_capsule/themes/colors.dart';
import 'package:tek_capsule/locale/locales.dart';

class NewsContent {
  final String image;
  final String? headline;
  final String? description;

  NewsContent(this.image, this.headline, this.description);
}

class NewsComponent extends StatefulWidget {
  bool showAppbar;
  bool reaction;
  final String? title;

  NewsComponent(
      [this.showAppbar = false,
      this.reaction = false,
      this.title = "My Feed"]);

  @override
  _NewsComponentState createState() => _NewsComponentState();
}

class _NewsComponentState extends State<NewsComponent> {
  bool react = false;
  bool bookmark = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<NewsContent> newsContent = [
      NewsContent(
          'assets/new_feature_image/news1.png',
          getTranslationOf('news_headline'),
          getTranslationOf('news_description')),
      NewsContent(
          'assets/new_feature_image/news7.png',
          getTranslationOf('news_headline'),
          getTranslationOf('news_description')),
      NewsContent(
          'assets/new_feature_image/news6.png',
          getTranslationOf('news_headline'),
          getTranslationOf('news_description')),
      NewsContent(
          'assets/new_feature_image/news5.png',
          getTranslationOf('news_headline'),
          getTranslationOf('news_description')),
      NewsContent(
          'assets/new_feature_image/news4.png',
          getTranslationOf('news_headline'),
          getTranslationOf('news_description')),
    ];
    return Scaffold(
        // bottomNavigationBar: widget.reaction == false
        //     ? FadedScaleAnimation(
        //         Container(
        //           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        //           decoration: BoxDecoration(
        //               color: lightScaffoldBackgroundColor,
        //               borderRadius:
        //                   BorderRadius.only(topLeft: Radius.circular(30))),
        //           child: ListTile(
        //             title: Text(
        //               getTranslationOf('similar_news')!,
        //               style: theme.textTheme.caption,
        //             ),
        //             subtitle: Text(
        //               getTranslationOf('news_content')!,
        //               style: theme.textTheme.bodyText2!
        //                   .copyWith(fontWeight: FontWeight.normal, height: 2),
        //               maxLines: 1,
        //               overflow: TextOverflow.ellipsis,
        //             ),
        //           ),
        //         ),
        //       )
        //     : react == false
        //         ? Container(
        //             padding: EdgeInsets.only(
        //                 left: 20, right: 20, bottom: 36, top: 24),
        //             decoration: BoxDecoration(
        //                 color: theme.primaryColor,
        //                 borderRadius:
        //                     BorderRadius.only(topLeft: Radius.circular(30))),
        //             child: FadedScaleAnimation(
        //               Row(
        //                 children: [
        //                   GestureDetector(
        //                     onTap: () {
        //                       setState(() {
        //                         react = !react;
        //                       });
        //                     },
        //                     child: Icon(
        //                       Icons.emoji_emotions_outlined,
        //                       size: 20,
        //                       color: theme.backgroundColor,
        //                     ),
        //                   ),
        //                   GestureDetector(
        //                     onTap: () {
        //                       setState(() {
        //                         react = !react;
        //                       });
        //                     },
        //                     child: Text(
        //                       '  ' + getTranslationOf('react')!,
        //                       style: theme.textTheme.caption!.copyWith(
        //                         color: theme.backgroundColor,
        //                       ),
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     width: 20,
        //                   ),
        //                   Icon(
        //                     Icons.comment,
        //                     color: theme.backgroundColor,
        //                     size: 20,
        //                   ),
        //                   Text(
        //                     '  ' + getTranslationOf('comment')!,
        //                     style: theme.textTheme.caption!.copyWith(
        //                       color: theme.backgroundColor,
        //                     ),
        //                   ),
        //                   Spacer(),
        //                   GestureDetector(
        //                     onTap: () {
        //                       setState(() {
        //                         bookmark = !bookmark;
        //                       });
        //                     },
        //                     child: bookmark == true
        //                         ? Icon(
        //                             Icons.bookmark,
        //                             size: 20,
        //                             color: theme.backgroundColor,
        //                           )
        //                         : Icon(
        //                             Icons.bookmark_border,
        //                             size: 20,
        //                             color: theme.backgroundColor,
        //                           ),
        //                   ),
        //                   SizedBox(
        //                     width: 20,
        //                   ),
        //                   Image.asset(
        //                     'assets/icons/ic_share.png',
        //                     scale: 2.5,
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           )
        //         : FadedScaleAnimation(
        //             GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   react = !react;
        //                 });
        //               },
        //               child: Container(
        //                 padding: EdgeInsets.only(bottom: 16, top: 16),
        //                 decoration: BoxDecoration(
        //                     color: theme.primaryColor,
        //                     borderRadius: BorderRadius.only(
        //                         topLeft: Radius.circular(30))),
        //                 child: Column(
        //                   mainAxisSize: MainAxisSize.min,
        //                   children: [
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                       children: [
        //                         FadedScaleAnimation(
        //                           Image.asset(
        //                             'assets/emojis/ic_lol.png',
        //                             scale: 3,
        //                           ),
        //                           durationInMilliseconds: 800,
        //                         ),
        //                         FadedScaleAnimation(
        //                           Image.asset(
        //                             'assets/emojis/ic_love.png',
        //                             scale: 3,
        //                           ),
        //                           durationInMilliseconds: 800,
        //                         ),
        //                         FadedScaleAnimation(
        //                           Image.asset(
        //                             'assets/emojis/ic_sad.png',
        //                             scale: 3,
        //                           ),
        //                           durationInMilliseconds: 800,
        //                         ),
        //                         FadedScaleAnimation(
        //                           Image.asset(
        //                             'assets/emojis/ic_wow.png',
        //                             scale: 3,
        //                           ),
        //                           durationInMilliseconds: 800,
        //                         ),
        //                         FadedScaleAnimation(
        //                           Image.asset(
        //                             'assets/emojis/ic_angry.png',
        //                             scale: 3,
        //                           ),
        //                           durationInMilliseconds: 800,
        //                         ),
        //                         FadedScaleAnimation(
        //                           Icon(
        //                             Icons.close,
        //                             color: theme.backgroundColor,
        //                           ),
        //                           durationInMilliseconds: 800,
        //                         ),
        //                       ],
        //                     ),
        //                     Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceEvenly,
        //                         children: [
        //                           RichText(
        //                             text: TextSpan(
        //                                 text: '50%',
        //                                 style: theme.textTheme.caption!
        //                                     .copyWith(
        //                                         fontSize: 8,
        //                                         color: theme.backgroundColor,
        //                                         fontWeight: FontWeight.bold),
        //                                 children: [
        //                                   TextSpan(
        //                                     text:
        //                                         ' ' + getTranslationOf('lol')!,
        //                                     style: theme.textTheme.caption!
        //                                         .copyWith(
        //                                             fontSize: 8,
        //                                             color:
        //                                                 theme.backgroundColor),
        //                                   )
        //                                 ]),
        //                           ),
        //                           RichText(
        //                             text: TextSpan(
        //                                 text: '29%',
        //                                 style: theme.textTheme.caption!
        //                                     .copyWith(
        //                                         fontSize: 8,
        //                                         color: theme.backgroundColor,
        //                                         fontWeight: FontWeight.bold),
        //                                 children: [
        //                                   TextSpan(
        //                                     text: ' ' +
        //                                         getTranslationOf('loved')!,
        //                                     style: theme.textTheme.caption!
        //                                         .copyWith(
        //                                             fontSize: 8,
        //                                             color:
        //                                                 theme.backgroundColor),
        //                                   )
        //                                 ]),
        //                           ),
        //                           RichText(
        //                             text: TextSpan(
        //                                 text: '12%',
        //                                 style: theme.textTheme.caption!
        //                                     .copyWith(
        //                                         fontSize: 8,
        //                                         color: theme.backgroundColor,
        //                                         fontWeight: FontWeight.bold),
        //                                 children: [
        //                                   TextSpan(
        //                                     text:
        //                                         ' ' + getTranslationOf('sad')!,
        //                                     style: theme.textTheme.caption!
        //                                         .copyWith(
        //                                             fontSize: 8,
        //                                             color:
        //                                                 theme.backgroundColor),
        //                                   )
        //                                 ]),
        //                           ),
        //                           RichText(
        //                             text: TextSpan(
        //                                 text: '6%',
        //                                 style: theme.textTheme.caption!
        //                                     .copyWith(
        //                                         fontSize: 8,
        //                                         color: theme.backgroundColor,
        //                                         fontWeight: FontWeight.bold),
        //                                 children: [
        //                                   TextSpan(
        //                                     text: ' ' +
        //                                         getTranslationOf('surprised')!,
        //                                     style: theme.textTheme.caption!
        //                                         .copyWith(
        //                                             fontSize: 8,
        //                                             color:
        //                                                 theme.backgroundColor),
        //                                   )
        //                                 ]),
        //                           ),
        //                           RichText(
        //                             text: TextSpan(
        //                                 text: '3%',
        //                                 style: theme.textTheme.caption!
        //                                     .copyWith(
        //                                         fontSize: 8,
        //                                         color: theme.backgroundColor,
        //                                         fontWeight: FontWeight.bold),
        //                                 children: [
        //                                   TextSpan(
        //                                     text: ' ' +
        //                                         getTranslationOf('angry')!,
        //                                     style: theme.textTheme.caption!
        //                                         .copyWith(
        //                                             fontSize: 8,
        //                                             color:
        //                                                 theme.backgroundColor),
        //                                   )
        //                                 ]),
        //                           ),
        //                           Text(
        //                             getTranslationOf('close')!,
        //                             style: theme.textTheme.caption!.copyWith(
        //                               color: theme.backgroundColor,
        //                               fontSize: 8,
        //                             ),
        //                           )
        //                         ]),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        backgroundColor: theme.backgroundColor,
        drawer: AppDrawer(),
        body: PageView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: newsContent.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return FadedSlideAnimation(
                Column(
                  // physics: NeverScrollableScrollPhysics(),
                  // padding: EdgeInsets.zero,
                  children: [
                    Stack(
                      children: [
                        Image.asset(newsContent[index].image),
                        PositionedDirectional(
                          bottom: 0,
                          start: 0,
                          end: 0,
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                                color: theme.backgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30))),
                          ),
                        ),
                        if (widget.showAppbar)
                          Frost(
                            child: AppBar(
                              centerTitle: true,
                              iconTheme: IconThemeData(color: theme.primaryColor),
                              title: Text(
                                widget.title!,
                                style: theme.textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            frostColor: Colors.white,
                            blur: 5,
                            frostOpacity: 0.05,
                          ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            PositionedDirectional(
                              end: 24,
                              top: 40,
                              child: Image.asset(
                                'assets/ic_swipeleft.png',
                                scale: 2,
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.showAppbar = !widget.showAppbar;
                                      widget.reaction = !widget.reaction;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: FadedSlideAnimation(
                                      Text(
                                        newsContent[index].headline!,
                                        style:
                                            theme.textTheme.headline6!.copyWith(
                                          fontSize: 18,
                                        ),
                                      ),
                                      beginOffset: Offset(0, 3),
                                      endOffset: Offset(0, 0),
                                      slideCurve: Curves.linearToEaseOut,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.reaction = !widget.reaction;
                                      widget.showAppbar = !widget.showAppbar;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: FadedSlideAnimation(
                                      Text(
                                        newsContent[index].description!,
                                        style:
                                            theme.textTheme.subtitle2!.copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                        ),
                                      ),
                                      beginOffset: Offset(0, 3),
                                      endOffset: Offset(0, 0),
                                      slideCurve: Curves.linearToEaseOut,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, PageRoutes.comment);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Row(
                                      children: [
                                        FadedScaleAnimation(
                                          Image.asset(
                                            'assets/emojis/ic_love.png',
                                            scale: 3.5,
                                          ),
                                          durationInMilliseconds: 700,
                                        ),
                                        Text(
                                          '  ' +
                                              '1.8k ' +
                                              getTranslationOf('reacted')! +
                                              '   ',
                                          style: theme.textTheme.caption,
                                        ),
                                        Icon(
                                          Icons.circle,
                                          size: 5,
                                          color: theme.primaryColor,
                                        ),
                                        Text(
                                          '   ' +
                                              '59 ' +
                                              getTranslationOf('comments')!,
                                          style: theme.textTheme.caption,
                                        ),
                                        Spacer(),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            getTranslationOf(
                                                'the_time_express')!,
                                            style: theme.textTheme.caption!
                                                .copyWith(
                                              color: theme.primaryColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                beginOffset: Offset(0, 0.3),
                endOffset: Offset(0, 0),
                slideCurve: Curves.linearToEaseOut,
              );
            }));
  }
}

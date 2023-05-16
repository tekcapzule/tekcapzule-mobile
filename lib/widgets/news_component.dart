import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/widgets/app_drawer.dart';
import 'package:tek_capsule/core/locale/locales.dart';

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
      [this.showAppbar = false, this.reaction = false, this.title = "My Feed"]);

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
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 36, top: 24),
          decoration: BoxDecoration(
            color: Color(0xff3A3A3A),
          ),
          child: FadedScaleAnimation(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.bookmark_add_outlined,
                    size: 20,
                    color: theme.colorScheme.background,
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       react = !react;
                //     });
                //   },
                //   child: Text(
                //     '  ' + getTranslationOf('react')!,
                //     style: theme.textTheme.caption!.copyWith(
                //       color: theme.backgroundColor,
                //     ),
                //   ),
                // ),
                Icon(
                  Icons.thumb_up_alt_outlined,
                  color: theme.colorScheme.background,
                  size: 20,
                ),
                // Text(
                //   '  ' + getTranslationOf('comment')!,
                //   style: theme.textTheme.caption!.copyWith(
                //     color: theme.backgroundColor,
                //   ),
                // ),
                Icon(
                  Icons.comment_outlined,
                  color: theme.colorScheme.background,
                  size: 20,
                ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       bookmark = !bookmark;
                //     });
                //   },
                //   child: bookmark == true
                //       ? Icon(
                //           Icons.bookmark,
                //           size: 20,
                //           color: theme.backgroundColor,
                //         )
                //       : Icon(
                //           Icons.bookmark_border,
                //           size: 20,
                //           color: theme.backgroundColor,
                //         ),
                // ),
                Icon(
                  Icons.file_upload_outlined,
                  color: theme.colorScheme.background,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: theme.colorScheme.background,
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
                    Column(
                      children: [
                        Frost(
                          child: AppBar(
                            centerTitle: true,
                            iconTheme: IconThemeData(color: theme.primaryColor),
                            title: Text(
                              widget.title!,
                              style: theme.textTheme.titleMedium!.copyWith(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          frostColor: Colors.white,
                          blur: 5,
                          frostOpacity: 0.05,
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 400,
                              child: Image.asset(
                                newsContent[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              top: 330,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 75,
                                      height: 30,
                                      child: Container(
                                        color: theme.primaryColor,
                                        child: Center(
                                          child: Text('#Cloud',
                                              style: theme.textTheme.titleMedium!
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 18,
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      height: 30,
                                      child: Container(
                                        color: Colors.black.withOpacity(0.5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                              Icons.more_time_outlined,
                                              color: theme.colorScheme.background,
                                              size: 18,
                                            ),
                                            Text('20 min',
                                                style: theme
                                                    .textTheme.titleMedium!
                                                    .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        // PositionedDirectional(
                        //   bottom: 0,
                        //   start: 0,
                        //   end: 0,
                        //   child: Container(
                        //     height: 20,
                        //     decoration: BoxDecoration(
                        //       color: theme.backgroundColor,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // PositionedDirectional(
                            //   end: 24,
                            //   top: 40,
                            //   child: Image.asset(
                            //     'assets/ic_swipeleft.png',
                            //     scale: 2,
                            //   ),
                            // ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: FadedSlideAnimation(
                                    SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Text(
                                          newsContent[index].headline!,
                                          style: theme.textTheme.titleMedium!
                                              .copyWith(
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                    beginOffset: Offset(0, 3),
                                    endOffset: Offset(0, 0),
                                    slideCurve: Curves.linearToEaseOut,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: FadedSlideAnimation(
                                    SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'by Linjith Kunnon',
                                                style: theme
                                                    .textTheme.titleMedium!
                                                    .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  '(August 16, 2021)',
                                                  style: theme
                                                      .textTheme.titleMedium!
                                                      .copyWith(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    beginOffset: Offset(0, 3),
                                    endOffset: Offset(0, 0),
                                    slideCurve: Curves.linearToEaseOut,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: FadedSlideAnimation(
                                      Text(
                                        newsContent[index].description!,
                                        style:
                                            theme.textTheme.titleSmall!.copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16,
                                        ),
                                      ),
                                      beginOffset: Offset(0, 3),
                                      endOffset: Offset(0, 0),
                                      slideCurve: Curves.linearToEaseOut,
                                    ),
                                  ),
                                ),

                                // GestureDetector(
                                //   onTap: () {
                                //     Navigator.pushNamed(
                                //         context, PageRoutes.comment);
                                //   },
                                //   child: Padding(
                                //     padding: EdgeInsets.symmetric(
                                //       horizontal: 16,
                                //     ),
                                //     child: Row(
                                //       children: [
                                //         FadedScaleAnimation(
                                //           Image.asset(
                                //             'assets/emojis/ic_love.png',
                                //             scale: 3.5,
                                //           ),
                                //           durationInMilliseconds: 700,
                                //         ),
                                //         Text(
                                //           '  ' +
                                //               '1.8k ' +
                                //               getTranslationOf('reacted')! +
                                //               '   ',
                                //           style: theme.textTheme.caption,
                                //         ),
                                //         Icon(
                                //           Icons.circle,
                                //           size: 5,
                                //           color: theme.primaryColor,
                                //         ),
                                //         Text(
                                //           '   ' +
                                //               '59 ' +
                                //               getTranslationOf('comments')!,
                                //           style: theme.textTheme.caption,
                                //         ),
                                //         Spacer(),
                                //         Expanded(
                                //           flex: 3,
                                //           child: Text(
                                //             getTranslationOf(
                                //                 'the_time_express')!,
                                //             style: theme.textTheme.caption!
                                //                 .copyWith(
                                //               color: theme.primaryColor,
                                //             ),
                                //             overflow: TextOverflow.ellipsis,
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
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

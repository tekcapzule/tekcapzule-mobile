import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tek_capsule/business_logic/capsule_bloc.dart';
import 'package:tek_capsule/business_logic/widget/root_injector_widget.dart';
import 'package:tek_capsule/features/news/full_news.dart';
import 'package:tek_capsule/infrastructure/model/capsule_details.dart';
import 'package:tek_capsule/widgets/action_indicator.dart';
import 'package:tek_capsule/widgets/app_drawer.dart';
import 'package:tek_capsule/core/locale/locales.dart';
import 'package:tek_capsule/widgets/swipe_detector.dart';

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
  final CapsuleBloc capsuleBloc = CapsuleBloc();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 18, top: 18),
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: theme.primaryColor),
          title: Text(
            widget.title!,
            style: theme.textTheme.titleMedium!.copyWith(
              color: Color.fromARGB(255, 102, 101, 101),
              fontSize: 16,
            ),
          ),
        ),
        body: StreamBuilder<List<CapsuleDetails>>(
            stream: capsuleBloc.getAllCapsules(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: theme.primaryColor,
                          strokeWidth: 2.6,
                        ),
                      ));
                case ConnectionState.done:
                  if (snapshot.hasError) return Text('Err: ${snapshot.error}');
                  List<CapsuleDetails> capsuleDetails = snapshot.data!;
                  final scaffoldkey = RootInjectorWidget.of(context)!
                      .applicationBloc
                      .globalscaffoldKey;
                  final scaffoldState = scaffoldkey.currentState;
                  if (capsuleDetails.length > 0) {
                    capsuleDetails[0].resourceUrl =
                    'https://www.tekcapsule.com/';
                    capsuleDetails[1].resourceUrl =
                    'https://tekcapsule.blog/the-rise-of-artificial-intelligence-exploring-the-benefits-challenges-and-future-implications/';
                    if (scaffoldState != null) {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        scaffoldState.showSnackBar(ActionIndicator()
                            .getSnackBar(context, 'Topics fetched!'));
                      });
                    }
                    return getDashBoardFeedWidget(capsuleDetails, theme);
                  } else {
                    if (scaffoldState != null) {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        scaffoldState.showSnackBar(ActionIndicator()
                            .getSnackBar(context, 'No topics available!'));
                      });
                    }
                    return getDashBoardFeedWidget([], theme);
                  }
              }
            }));
  }

  void loadWebPage({required String? url, required String? title}) {
    if (url == null) return;
    Navigator.push(context,
        CupertinoPageRoute(builder: (context) => FullNews(url, title!)));
  }

  PageView getDashBoardFeedWidget(
      List<CapsuleDetails> capsuleData, ThemeData theme) {
    return PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: capsuleData.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return FadedSlideAnimation(
            SwipeDetector(
              onSwipeLeft: () {
                loadWebPage(
                    url: capsuleData[index].resourceUrl!,
                    title: capsuleData[index].title!);
              },
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 3,
                        child: Image.network(
                            capsuleData[index].imageUrl!,
                            fit: BoxFit.cover
                        ),
                      ),
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding:const EdgeInsets.only(left: 0, right: 0),
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
                                    child: Text(
                                        capsuleData[index].tags![1],
                                        style: theme
                                            .textTheme.titleMedium!
                                            .copyWith(
                                          color: Colors.white,
                                          fontSize: 14,
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
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.more_time_outlined,
                                        color:
                                        theme.colorScheme.background,
                                        size: 14,
                                      ),
                                      Text(
                                          capsuleData[index]
                                              .duration!
                                              .toString(),
                                          style: theme
                                              .textTheme.titleMedium!
                                              .copyWith(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              loadWebPage(
                                  url: capsuleData[index].resourceUrl!,
                                  title: capsuleData[index].title!);
                            },
                            child: FadedSlideAnimation(
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    capsuleData[index].title!,
                                    style:
                                    theme.textTheme.titleMedium!.copyWith(
                                      fontSize: 16,
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
                                          capsuleData[index].author!,
                                          style: theme.textTheme.titleMedium!
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0),
                                          child: Text(
                                            capsuleData[index].publishedDate!,
                                            style: theme
                                                .textTheme.titleMedium!
                                                .copyWith(
                                              fontWeight: FontWeight.normal,
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
                            onTap: () {
                              loadWebPage(
                                  url: capsuleData[index].resourceUrl!,
                                  title: capsuleData[index].title!);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: FadedSlideAnimation(
                                Text(
                                  capsuleData[index].description!,
                                  style: theme.textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                  softWrap: false,
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                beginOffset: Offset(0, 3),
                                endOffset: Offset(0, 0),
                                slideCurve: Curves.linearToEaseOut,
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          );
        });
  }
}

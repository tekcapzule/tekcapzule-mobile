import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/business_logic/topic_bloc.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/infrastructure/model/topic_details.dart';

class DrawerItems {
  final IconData icon;
  final String? name;

  DrawerItems(this.icon, this.name);
}

class SuggestedTopics {
  final String image;
  final String? title;

  SuggestedTopics(this.image, this.title);
}

class AppDrawer extends StatelessWidget {
  final TopicBloc topicBloc = new TopicBloc();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<DrawerItems> _drawerItems = [
      DrawerItems(Icons.explore, 'MY FEED'),
      DrawerItems(Icons.bookmark_added, 'BOOKMARK'),
      DrawerItems(Icons.speaker_notes, 'TRENDING'),
      DrawerItems(Icons.book_rounded, 'EDITORS PICK'),
    ];
    List<SuggestedTopics> _suggestedTopics = [
      SuggestedTopics('assets/topics/ic_trending.png', 'Cyber Security'),
      SuggestedTopics('assets/topics/ic_sports.png', 'Edge Computing'),
      SuggestedTopics('assets/topics/ic_politics.png', 'Human Augmentation'),
      SuggestedTopics(
          'assets/topics/ic_business.png', 'Intelligent process Automation'),
      SuggestedTopics('assets/topics/ic_tech.png', 'Internet of Behaviours'),
      SuggestedTopics('assets/topics/ic_travel.png', 'Mixed Reality'),
      SuggestedTopics('assets/topics/ic_fashion.png', 'Tactile VR'),
      SuggestedTopics('assets/topics/ic_education.png', '5G'),
      SuggestedTopics('assets/topics/ic_health.png', 'AI/ML'),
      SuggestedTopics('assets/topics/ic_fun.png', 'Big Data'),
      SuggestedTopics('assets/topics/ic_hollywodd.png', 'Blockchain'),
    ];
    return Container(
      width: 350,
      color: theme.scaffoldBackgroundColor,
      child: Drawer(
        child: FadedSlideAnimation(
          Container(
            color: theme.scaffoldBackgroundColor,
            child: ListView(
              children: [
                //  Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //     child: Align(
                //       alignment: Alignment.topLeft,
                //       child: IconButton(
                //           icon: Icon(
                //             Icons.close,
                //             color: theme.primaryColor,
                //             size: 20,
                //           ),
                //           onPressed: () {
                //             Navigator.pop(context);
                //           }),
                //     ),
                //   ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 30),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/profiles/change profile pic copy 3-1.png',
                        scale: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'Samantha\nSmith',
                          style: theme.textTheme.titleMedium!
                              .copyWith(fontSize: 20),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, PageRoutes.preferences)
                        },
                        child: Icon(
                          Icons.settings,
                          color: theme.primaryColor,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: theme.focusColor,
                  child: ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      shrinkWrap: true,
                      itemCount: _drawerItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(
                            _drawerItems[index].icon,
                            color: theme.primaryColor,
                          ),
                          title: Text(
                            _drawerItems[index].name!,
                            style: theme.textTheme.titleMedium!
                                .copyWith(fontSize: 18),
                          ),
                          onTap: index == 0
                              ? () {
                                  Navigator.pushNamed(context, PageRoutes.news);
                                }
                              : index == 1
                                  ? () {
                                      Navigator.pushNamed(
                                          context, PageRoutes.bookmarked);
                                    }
                                  : () {
                                      // Navigator.pushNamed(
                                      //     context, PageRoutes.preferences);
                                    },
                        );
                      }),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'TOPICS',
                          style: theme.textTheme.titleMedium!
                              .copyWith(fontSize: 18),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.48,
                        child: StreamBuilder<List<TopicDetails>>(
                            stream: topicBloc.getAllTopics(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                case ConnectionState.active:
                                  return Center(
                                      child: CircularProgressIndicator());
                                case ConnectionState.done:
                                  if (snapshot.hasError)
                                    return Text('Err: ${snapshot.error}');
                                  List<TopicDetails> topicList = snapshot.data!;
                                  List<SuggestedTopics>? listOfSuggestedTopics = [];
                                  topicList.forEach((element) {
                                    listOfSuggestedTopics.add(
                                        SuggestedTopics(element.code!, element.title));
                                  });
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: listOfSuggestedTopics.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, PageRoutes.news,
                                                arguments:
                                                    listOfSuggestedTopics[index]
                                                        .title);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(12),
                                            margin: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: theme
                                                    .colorScheme.background),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listOfSuggestedTopics[index]
                                                      .title!,
                                                  style: theme
                                                      .textTheme.titleMedium!
                                                      .copyWith(fontSize: 16.0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                              }
                            }),
                      )
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //       vertical: 16, horizontal: 16.0),
                //   child: BuyThisApp.button(
                //     'qunews',
                //     'http://bit.ly/cc_flutter_qunews',
                //     color: Theme.of(context).primaryColor,
                //   ),
                // ),
                // BuyThisApp.developerRow(
                //     Colors.transparent, Theme.of(context).primaryColor),
              ],
            ),
          ),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ),
      ),
    );
  }
}

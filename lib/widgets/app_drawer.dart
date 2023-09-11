import 'package:flutter/material.dart';
import 'package:tek_capsule/business_logic/topic_bloc.dart';
import 'package:tek_capsule/business_logic/widget/root_injector_widget.dart';
import 'package:tek_capsule/common/model/app-constant.dart';
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
  final String? code;

  SuggestedTopics({required this.image, required this.title, this.code});
}

class AppDrawer extends StatelessWidget {
  final TopicBloc topicBloc = new TopicBloc();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<DrawerItems> _drawerItems = [
      DrawerItems(Icons.explore, 'My Feed'),
      DrawerItems(Icons.bookmark_added, 'Bookmark'),
      DrawerItems(Icons.speaker_notes, 'Trending'),
      // DrawerItems(Icons.book_rounded, 'EDITORS PICK'),
    ];

    return Container(      
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: theme.scaffoldBackgroundColor,
      child: Drawer(
        child: Container(
          padding: EdgeInsets.only(top: 30),
          color: theme.scaffoldBackgroundColor,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/profiles/change profile pic copy 3-1.png',
                      scale: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Samantha\nSmith',
                        style:
                            theme.textTheme.titleMedium!.copyWith(fontSize: 18),
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
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: theme.focusColor,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    shrinkWrap: true,
                    itemCount: _drawerItems.length,
                    itemExtent: 50.0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          _drawerItems[index].icon,
                          color: theme.primaryColor,
                          size: 20,
                        ),
                        title: Text(
                          _drawerItems[index].name!,
                          style: theme.textTheme.titleMedium!
                              .copyWith(fontSize: 14),
                        ),
                        onTap: index == 0
                            ? () {
                                RootInjectorWidget.of(context)
                                    ?.applicationBloc
                                    .applicationState
                                    .selectedTopic = null;
                                    RootInjectorWidget.of(context)
                                            ?.applicationBloc
                                            .applicationState
                                            .selectedCapsuleType =
                                        CapsuleType.NONE;
                                Navigator.pushNamed(context, PageRoutes.news);
                              }
                            : index == 1
                                ? () {
                                    RootInjectorWidget.of(context)
                                        ?.applicationBloc
                                        .applicationState
                                        .selectedTopic = null;
                                    RootInjectorWidget.of(context)
                                            ?.applicationBloc
                                            .applicationState
                                            .selectedCapsuleType =
                                        CapsuleType.BOOKMARK;
                                    Navigator.pushNamed(
                                        context, PageRoutes.news,
                                        arguments: "Bookmark");
                                    // Navigator.pushNamed(
                                    //     context, PageRoutes.bookmarked);
                                    // ActionIndicator().getDialog(
                                    //     context, "Alert", "Work in progress!");
                                  }
                                : () {
                                    RootInjectorWidget.of(context)
                                        ?.applicationBloc
                                        .applicationState
                                        .selectedTopic = null;
                                    RootInjectorWidget.of(context)
                                            ?.applicationBloc
                                            .applicationState
                                            .selectedCapsuleType =
                                        CapsuleType.TRENDING;
                                    Navigator.pushNamed(
                                        context, PageRoutes.news,
                                        arguments: "Trending");
                                    // Navigator.pushNamed(
                                    //     context, PageRoutes.preferences);
                                    // ActionIndicator().getDialog(context, "Alert", "Work in progress!");
                                  },
                      );
                    }),
              ),
         
             Container(
              padding: const EdgeInsets.only(left: 16.0, top: 25.0),
               child: Align(
                alignment: Alignment.topLeft,
                           child: Text(
                          'Topics',
                          style:
                              theme.textTheme.titleMedium!.copyWith(fontSize: 16),
                        ),
                      ),
             ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 16.0, top: 15.0,  left: 16.0, bottom: 20.0),
                  child: StreamBuilder<List<TopicDetails>?>(
                            stream: topicBloc.getAllTopics(),
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
                                  if (snapshot.hasError)
                                    return Text('Err: ${snapshot.error}');
                                  List<TopicDetails> topicList = snapshot.data!;
                                  List<SuggestedTopics>? listOfSuggestedTopics =
                                      [];
                                  topicList.forEach((element) {
                                    listOfSuggestedTopics.add(SuggestedTopics(
                                        image: '',
                                        title: element.title,
                                        code: element.code!));
                                  });
                                  return ListView.builder(   
                                                        shrinkWrap: true,                                   
                                      itemCount: listOfSuggestedTopics.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            RootInjectorWidget.of(context)
                                                    ?.applicationBloc
                                                    .applicationState
                                                    .selectedTopic =
                                                listOfSuggestedTopics[index];
                                            Navigator.pushNamed(
                                                context, PageRoutes.news,
                                                arguments:
                                                    listOfSuggestedTopics[index]
                                                        .title);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color:
                                                    theme.colorScheme.background),
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
                                                      .copyWith(fontSize: 14.0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                              }
                            }),
                ),
              )
              ,
            ],
          ),
        ),
      ),
    );
  }
}

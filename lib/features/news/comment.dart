import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/core/themes/colors.dart';
import 'package:tek_capsule/core/locale/locales.dart';

class Comments {
  final String image;
  final String name;
  final String date;
  final String comment;

  Comments(this.image, this.name, this.date, this.comment);
}

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<Comments> _comments = [
      Comments(
          'assets/comments/Layer 863.png',
          'Jassica Haydon',
          '20 Dec, 11:20 am',
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock,'),
      Comments(
          'assets/comments/Layer 858.png',
          'Lisa Maxvel',
          '20 Dec, 11:20 am',
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock,'),
      Comments(
          'assets/comments/Layer 848.png',
          'Taylor Anderson',
          '20 Dec, 11:20 am',
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock,'),
      Comments(
          'assets/comments/Layer 863.png',
          'Jassica Haydon',
          '20 Dec, 11:20 am',
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock,'),
      Comments(
          'assets/comments/Layer 848.png',
          'Taylor Anderson',
          '20 Dec, 11:20 am',
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock,'),
      Comments(
          'assets/comments/Layer 863.png',
          'Jassica Haydon',
          '20 Dec, 11:20 am',
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock,'),
    ];
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: FadedSlideAnimation(
        Column(
          children: [
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/News1.png',
                      ),
                      Frost(
                        frostColor: theme.primaryColor,
                        frostOpacity: 0.4,
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 40, bottom: 22, left: 24, right: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: iconColor,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              Text(
                                context.getTranslationOf('news_headline')!,
                                style: theme.textTheme.titleLarge!.copyWith(
                                  color: whiteTextColor,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Text(
                                    context
                                        .getTranslationOf('the_time_express')!,
                                    style: theme.textTheme.bodySmall!.copyWith(
                                      color: theme.primaryColor,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: theme.primaryColor,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                    child: Text(
                      context.getTranslationOf('recent_comments')!,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _comments.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Image.asset(
                                    _comments[index].image,
                                    scale: 3,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    _comments[index].name,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                  Spacer(),
                                  Text(
                                    _comments[index].date,
                                    style: theme.textTheme.bodySmall!.copyWith(
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                _comments[index].comment,
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: theme.focusColor,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: 0.5,
                              color: theme.hintColor,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              padding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Image.asset(
                      'assets/profiles/change profile pic copy 3-1.png',
                      scale: 5,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText:
                                context.getTranslationOf('write_your_comment'),
                            hintStyle: theme.textTheme.bodySmall,
                            enabledBorder: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.send,
                      color: theme.primaryColor,
                      size: 20,
                    ),
                    SizedBox(
                      width: 12,
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
      ),
    );
  }
}

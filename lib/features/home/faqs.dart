import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/core/locale/locales.dart';

class Questions {
  String question;
  bool isOpen;
  Questions(this.question, this.isOpen);
}

class Faqs extends StatefulWidget {
  @override
  _FaqsState createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  List<bool> isOpen = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<String> _questions = [
      'What is Lorem ipsum dolor?',
      'What is Lorem ipsum dolor?',
      'What is Lorem ipsum dolor?',
      'What is Lorem ipsum dolor?',
      'What is Lorem ipsum dolor?',
      'What is Lorem ipsum dolor?',
      'What is Lorem ipsum dolor?',
      'What is Lorem ipsum dolor?',
      'What is Lorem ipsum dolor?',
      'What is Lorem ipsum dolor?',
      'What is Lorem ipsum dolor?',
      'What is Lorem ipsum dolor?',
      'What is Lorem ipsum dolor?',
      'What is Lorem ipsum dolor?',
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.focusColor),
      ),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 24,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(getTranslationOf('faqs')!,
                        style: theme.textTheme.headline6),
                    Text(
                      getTranslationOf('get_your_answers')!,
                      style: theme.textTheme.subtitle2,
                    ),
                  ],
                ),
                Spacer(),
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    'assets/vct_privacy.png',
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                decoration: BoxDecoration(
                    color: theme.backgroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: _questions.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isOpen[index] = !isOpen[index];
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    _questions[index],
                                    style: theme.textTheme.bodyText1,
                                  ),
                                  Spacer(),
                                  isOpen[index]
                                      ? Icon(
                                          Icons.keyboard_arrow_up,
                                          color: theme.hintColor,
                                        )
                                      : Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          color: theme.hintColor,
                                        )
                                ],
                              ),
                            ),
                            isOpen[index]
                                ? SizedBox(
                                    height: 15,
                                  )
                                : SizedBox.shrink(),
                            isOpen[index]
                                ? Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                                    style: theme.textTheme.caption,
                                  )
                                : SizedBox.shrink()
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
        beginOffset: Offset(0.3, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

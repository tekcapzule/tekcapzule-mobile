import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/core/locale/locales.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.focusColor),
      ),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(context.getTranslationOf('privacy_policy')!,
                            style: theme.textTheme.titleLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                            context
                                .getTranslationOf('know_our_privacy_policies')!,
                            style: theme.textTheme.titleSmall),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 3,
                    child: FadedScaleAnimation(
                      Image.asset(
                        "assets/vct_privacy.png",
                      ),
                      durationInMilliseconds: 600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
              height: MediaQuery.of(context).size.height * 0.68,
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        context.getTranslationOf('terms_of_use')!,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: 15,
                          letterSpacing: 0.08,
                        ),
                      ),
                    ),
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.focusColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        context.getTranslationOf('privacy_policy')!,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: 15,
                          letterSpacing: 0.08,
                          color: theme.focusColor,
                        ),
                      ),
                    ),
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.focusColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: theme.focusColor,
                          )),
                    ),
                  ],
                ),
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

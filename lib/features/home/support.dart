import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/widgets/custom_button.dart';
import 'package:tek_capsule/widgets/entry_field.dart';
import 'package:tek_capsule/core/locale/locales.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.focusColor),
      ),
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.getTranslationOf('support')!,
                          style: theme.textTheme.titleLarge,
                        ),
                        Text(context.getTranslationOf('connect_us')!,
                            style: theme.textTheme.titleSmall),
                      ],
                    ),
                    Spacer(),
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        'assets/vct_language.png',
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        //margin: EdgeInsets.only(top: 184),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  socialButton('assets/icons/ic_call.png',
                                      context.getTranslationOf('call_us')!),
                                  Container(
                                    width: 1,
                                    height: 25,
                                    color: Theme.of(context).colorScheme.background,
                                  ),
                                  socialButton('assets/icons/mail.png',
                                      context.getTranslationOf('mail_us')!)
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.background,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, left: 20),
                                      child: Text(
                                          context.getTranslationOf('write_us')!,
                                          style: theme.textTheme.titleLarge),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                          context.getTranslationOf('let_us')!,
                                          style: theme.textTheme.titleSmall),
                                    ),
                                    Spacer(),
                                    EntryField(
                                      label: context.getTranslationOf(
                                          'phone_number_or_email'),
                                      hint: context
                                          .getTranslationOf('add_contact_info'),
                                    ),
                                    EntryField(
                                      label:
                                          context.getTranslationOf('add_your'),
                                      hint: context.getTranslationOf(
                                          'write_your_message'),
                                    ),
                                    Spacer(
                                      flex: 5,
                                    ),
                                    CustomButton(
                                      text: context.getTranslationOf('submit'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0.3, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  TextButton socialButton(String icon, String text) {
    return TextButton.icon(
      icon: ImageIcon(
        AssetImage(icon),
        color: Theme.of(context).colorScheme.background,
        size: 16,
      ),
      onPressed: () {},
      label: Text(
        '  ' + text,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.background),
      ),
    );
  }
}

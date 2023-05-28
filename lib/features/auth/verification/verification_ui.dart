import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/business_logic/application_bloc.dart';
import 'package:tek_capsule/business_logic/widget/root_injector_widget.dart';
import 'package:tek_capsule/widgets/custom_button.dart';
import 'package:tek_capsule/widgets/entry_field.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/core/locale/locales.dart';

class VerificationUI extends StatefulWidget {
  @override
  _VerificationUIState createState() => _VerificationUIState();
}

class _VerificationUIState extends State<VerificationUI> {
  final otpInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    return FadedSlideAnimation(
      Scaffold(
        body: Column(
          children: [
            Container(
              color: theme.focusColor,
              child: Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Image.asset("assets/vct_verification.png")),
            ),
            SizedBox(
              height: 1,
              child: Center(
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: 2,
                  color: Color(0xffE2E2E2),
                ),
              ),
            ),
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.68,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30, left: 16, bottom: 6, right: 16),
                      child: Text(
                        getTranslationOf('verification')!,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 16, bottom: 30, right: 16),
                      child: Text(
                        getTranslationOf('we_have')!,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    EntryField(
                      textController: otpInputController,
                      label: getTranslationOf('enter_code'),
                      hint: getTranslationOf('enter_six'),
                    ),
                    Spacer(),
                    CustomButton(
                      textColor: Theme.of(context).colorScheme.background,
                      text: getTranslationOf('get_started'),
                      onTap: () async {
                        final config =
                            await ApplicationBloc.getAppConfiguration('dev');
                        if (config.features!.awsCognito!) {
                          final result = await RootInjectorWidget.of(context)!
                              .authService
                              .confirmUser(routeArgs.toString(),
                                  otpInputController.text);
                          if (result!.isSignUpComplete) {
                            Navigator.pushNamed(context, PageRoutes.news);
                          }
                        } else {
                          Navigator.pushNamed(context, PageRoutes.news);
                        }
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      beginOffset: Offset(0, 0.3),
      endOffset: Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
    );
  }
}

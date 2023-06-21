import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/business_logic/application_bloc.dart';
import 'package:tek_capsule/business_logic/widget/root_injector_widget.dart';
import 'package:tek_capsule/widgets/custom_button.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/core/locale/locales.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: theme.primaryColor),
      ),
      body: FadedSlideAnimation(
        Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/headerbg.png',
                      height: MediaQuery.of(context).size.height / 3.6,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    start: 10,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 15, top: 30),
                      child: Text(
                        context.getTranslationOf('my_profile')!,
                        style: theme.textTheme.titleLarge?.copyWith(
                            fontSize: 12
                        ),
                      ),
                    ),
                  ),
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    start: 10,
                    top: 44,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 15, top: 16),
                      child: Text(
                          context.getTranslationOf('everything_about_us')!,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleSmall?.copyWith(
                              fontSize: 12
                          ),),
                    ),
                  ),
                  PositionedDirectional(
                      end: 30,
                      top: 16,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          FadedScaleAnimation(
                            CircleAvatar(
                              child: Image.asset(
                                'assets/profiles/change profile pic copy 3-1.png',
                              ),
                              radius: 30,
                            ),
                            durationInMilliseconds: 400,
                          ),
                          PositionedDirectional(
                            start: 100,
                            top: 48,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.camera_alt,
                                color: theme.primaryColor,
                                size: 20,
                              ),
                              radius: 20,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                         children: [
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              context.getTranslationOf('full_name')!,
                              style: theme.textTheme.bodyLarge
                            ),
                          ),
                          subtitle: Text(
                            'Samantha Smith',

                          ),
                        ),
                             ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              context.getTranslationOf('email_address')!,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                          subtitle: Text('samantha@mail.com'),
                        ),
                                     ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              context.getTranslationOf('phone_number')!,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                          subtitle: Text('+1 987 654 3210'),
                        ),

                        CustomButton(
                          text: context
                              .getTranslationOf('logout')!
                              .toUpperCase(),
                          onTap: () async {
                            final config =
                                await ApplicationBloc.getAppConfiguration(
                                    'dev');
                            if (config.features!.awsCognito!) {
                              await RootInjectorWidget.of(context)!
                                  .authService
                                  .signOutUser();
                              Navigator.pushNamed(context, PageRoutes.signIn);
                            } else {
                              Navigator.pushNamed(context, PageRoutes.signIn);
                            }
                          },
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        beginOffset: Offset(0, 0.1),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
        slideDurationInMilliseconds: 10,
        durationInMilliseconds: 10,
      ),
    );
  }
}

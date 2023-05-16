import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/core/themes/theme_cubit.dart';
import 'package:tek_capsule/core/themes/colors.dart';
import 'package:tek_capsule/core/locale/locales.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlueContainerContent {
  final IconData icon;
  final String? title;
  final String? subtitle;

  BlueContainerContent(this.icon, this.title, this.subtitle);
}

class WhiteContainerContent {
  final IconData icon;
  final String? title;
  final String? subtitle;

  WhiteContainerContent(this.icon, this.title, this.subtitle);
}

class Preferences extends StatefulWidget {
  @override
  _PreferencesState createState() => _PreferencesState();
}

bool notifications = false;

class _PreferencesState extends State<Preferences> {
  late ThemeCubit _themeCubit;
  bool _theme = false;

  @override
  void initState() {
    super.initState();
    getTheme();
    _themeCubit = BlocProvider.of<ThemeCubit>(context);
  }

  getTheme() async {
    var prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool('isDark');
    if (isDark == null)
      setState(() {
        _theme = false;
      });
    else if (isDark)
      setState(() {
        _theme = false;
      });
    else
      setState(() {
        _theme = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<BlueContainerContent> _blueContainerContent = [
      BlueContainerContent(
          Icons.nightlight_round,
          getTranslationOf('night_mode'),
          getTranslationOf('better_reading_experience')),
      BlueContainerContent(Icons.public, getTranslationOf('language'),
          getTranslationOf('select_preferred_language')),
      BlueContainerContent(
          Icons.notifications,
          getTranslationOf('notifications'),
          getTranslationOf('get_notifications')),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.primaryColor),
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.myProfile);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Samantha Smith',
                      style: theme.textTheme.titleLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        getTranslationOf('my_profile')!,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              end: 28,
              top: 8,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.myProfile);
                },
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(50),
                  child: FadedScaleAnimation(
                    CircleAvatar(
                      child: Image.asset(
                          'assets/profiles/change profile pic copy 3-1.png'),
                      radius: 40,
                    ),
                    durationInMilliseconds: 800,
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              end: 90,
              top: 24,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.myProfile);
                },
                child: CircleAvatar(
                  backgroundColor: theme.colorScheme.background,
                  child: Icon(
                    Icons.camera_alt_sharp,
                    color: theme.primaryColor,
                    size: 16,
                  ),
                  radius: 16,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 30),
                margin: EdgeInsets.only(top: 120),
                decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                ),
                child: Column(
                  children: [
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              onTap: index == 1
                                  ? () {
                                      Navigator.pushNamed(
                                          context, PageRoutes.language);
                                    }
                                  : () {},
                              leading: Icon(
                                _blueContainerContent[index].icon,
                                color: Color(0xff3F4B61),
                              ),
                              title: Text(
                                _blueContainerContent[index].title!,
                                style: theme.textTheme.titleMedium!.copyWith(
                                    color: Color(0xff3F4B61), fontSize: 24.0),
                              ),
                              subtitle: Text(
                                _blueContainerContent[index].subtitle!,
                                style: theme.textTheme.bodyLarge,
                              ),
                              trailing: index == 0
                                  ? Switch(
                                      activeColor: Colors.lightGreen,
                                      value: _theme,
                                      onChanged: (value) {
                                        setState(() {
                                          _theme = value;
                                        });
                                        if (value)
                                          _themeCubit.selectLightTheme();
                                        else
                                          _themeCubit.selectDarkTheme();
                                      },
                                    )
                                  : index == 1
                                      ? Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              getTranslationOf('english')! +
                                                  ' ',
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(
                                                color: whiteTextColor
                                                    .withOpacity(0.7),
                                              ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_right,
                                              color: iconColor,
                                            ),
                                          ],
                                        )
                                      : Switch(
                                          activeColor: Colors.lightGreen,
                                          value: notifications,
                                          onChanged: (value) {
                                            setState(() {
                                              notifications = !notifications;
                                            });
                                          },
                                        ),
                            ),
                            SizedBox(
                              height: 1,
                              child: Center(
                                child: Container(
                                  margin: EdgeInsetsDirectional.only(
                                      start: 1.0, end: 1.0),
                                  height: 2,
                                  color: Color(0xffE2E2E2),
                                ),
                              ),
                            ),
                            SizedBox(height: 25.0,)
                          ],
                        );
                      },
                      itemCount: _blueContainerContent.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(8),
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

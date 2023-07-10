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
    return Scaffold(
         backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              color: Colors.white,
              child: Container(
                  color: Colors.white,
                      height: 110,
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
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  getTranslationOf('verification')!,
                  style:
                      theme.textTheme.titleMedium?.copyWith(fontSize: 14),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  getTranslationOf('we_have')!,
                  style:
                      theme.textTheme.titleSmall?.copyWith(fontSize: 12),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: EntryField(
                    textController: otpInputController,
                    label: getTranslationOf('enter_code'),
                    hint: getTranslationOf('enter_six'),
                  ),
                ),
              ),
            ),
            Column(
              children: [
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
              ],
            ),
          ],
            ),
        ),
      );
  }
}

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/business_logic/widget/root_injector_widget.dart';
import 'package:tek_capsule/widgets/custom_button.dart';
import 'package:tek_capsule/widgets/entry_field.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/core/locale/locales.dart';

class RegisterUI extends StatefulWidget {
  @override
  _RegisterUIState createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  List<String> gender = ["Male", "Female", "Others"];
  Object? selectGenderValue;

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final pwdController = TextEditingController();
  final dobController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    pwdController.dispose();
    dobController.dispose();
    nameController.dispose();
    super.dispose();
  }

// ignore: non_constant_identifier_names
  Row add_radio_button(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: selectGenderValue,
          onChanged: (value) {
            setState(() {
              print(value);
              selectGenderValue = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  Future<void> signUpUser(
    String name,
    String email,
    String password,
    String phone,
    String dob,
  ) async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.name: name,
        CognitoUserAttributeKey.email: email,
        CognitoUserAttributeKey.birthdate: dob,
        CognitoUserAttributeKey.phoneNumber: '+91$phone',
        CognitoUserAttributeKey.gender: selectGenderValue.toString(),
        CognitoUserAttributeKey.givenName: name,
        CognitoUserAttributeKey.preferredUsername: email
        // additional attributes as needed
      };
      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      print(result);
      if (result.isSignUpComplete) {
        Navigator.pushNamed(
          context,
          PageRoutes.verification,
          arguments: email,
        );
      }
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FadedSlideAnimation(
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: theme.focusColor,
          shadowColor: theme.focusColor,
          foregroundColor: theme.focusColor,
          elevation: 0.0,
          bottomOpacity: 0.0,
          iconTheme: IconThemeData(color: theme.primaryColor),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: Container(child: Image.asset("assets/vct_register.png")),
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
                height: MediaQuery.of(context).size.height * 0.68,
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: theme.backgroundColor,
                ),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, bottom: 10),
                          child: Text(
                            getTranslationOf('register')!,
                            style: theme.textTheme.subtitle1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            getTranslationOf('in_less_than')!,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.subtitle2,
                          ),
                        ),
                      ],
                    ),
                    EntryField(
                      label: getTranslationOf('full_name'),
                      hint: getTranslationOf('enter_full_name'),
                      textController: nameController,
                    ),
                    EntryField(
                      label: getTranslationOf('email_address'),
                      hint: getTranslationOf('enter_email_address'),
                      textController: emailController,
                    ),
                    EntryField(
                      label: getTranslationOf('phone_number'),
                      hint: getTranslationOf('enter_phone_number'),
                      textController: phoneController,
                    ),
                    EntryField(
                      label: getTranslationOf('password'),
                      hint: getTranslationOf('enter_password'),
                      textController: pwdController,
                      hideText: true,
                    ),
                    EntryField(
                      label: '',
                      hint: 'Date of birth (dd/MM/YYYY)',
                      textController: dobController,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 15, 50, 00),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              add_radio_button(0, 'Male'),
                              add_radio_button(1, 'Female'),
                              add_radio_button(2, 'Others'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        getTranslationOf('we_will_send')!,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.subtitle1,
                      ),
                    ),
                    CustomButton(
                      textColor: Theme.of(context).backgroundColor,
                      onTap: () async {
                        final result = await RootInjectorWidget.of(context)!
                            .authService
                            .signUpUser(
                                nameController.text,
                                emailController.text,
                                pwdController.text,
                                phoneController.text,
                                dobController.text,
                                selectGenderValue.toString());
                        if (result!.isSignUpComplete) {
                          Navigator.pushNamed(
                            context,
                            PageRoutes.verification,
                            arguments: emailController.text,
                          );
                        }
                      },
                    ),
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

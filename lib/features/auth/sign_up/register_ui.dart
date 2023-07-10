import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/business_logic/application_bloc.dart';
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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 30,
          elevation: 0.0,
          iconTheme: IconThemeData(color: theme.primaryColor),
        ),
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  child: SizedBox(
                     // color: Colors.white,
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: 90,
                      child: Image.asset("assets/vct_register.png",fit: BoxFit.contain,)),
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
              ],
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: Text(
                      getTranslationOf('register')!,
                      style: theme.textTheme.titleMedium?.copyWith(fontSize: 14),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      getTranslationOf('in_less_than')!,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.titleSmall?.copyWith(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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

                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Text(
                    getTranslationOf('we_will_send')!,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.subtitle1?.copyWith(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: CustomButton(
                    textColor: Theme.of(context).colorScheme.background,
                    onTap: () async {
                      final config =
                      await ApplicationBloc.getAppConfiguration('dev');
                      if (config.features!.awsCognito!) {
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
                      } else {
                        Navigator.pushNamed(
                          context,
                          PageRoutes.verification,
                          arguments: 'empty',
                        );
                      }
                    },
                  ),
                ),
                ],
            )
          ],
        ),
      );
  }
}

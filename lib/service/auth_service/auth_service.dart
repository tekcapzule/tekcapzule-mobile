import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tek_capsule/service/auth_service/aws_cognito_service.dart';
import 'package:tek_capsule/service/auth_service/base_auth_service.dart';

class AuthenticationService implements BaseAuthenticationService {
  final AwsCognitoService? awsCognitoService;

  AuthenticationService._(this.awsCognitoService);

  static Future<AuthenticationService> init() async {
    final awsCognitoService = AwsCognitoService();
    await awsCognitoService.addPlugin();
    await awsCognitoService.configure();
    return AuthenticationService._(awsCognitoService);
  }

  @override
  Future<SignInResult>? signInUser(String userName, String password) async {
    try {
      final auth = this.awsCognitoService!.getAuth();
      return await auth.signIn(
        username: userName,
        password: password,
      );
    } on AuthException catch (e) {
      safePrint(e.message);
      return Future.value(new SignInResult(isSignedIn: false));
    }
  }

  @override
  Future<SignUpResult?>? confirmUser(
      String userName, String oneTimecode) async {
    try {
      final auth = this.awsCognitoService!.getAuth();
      return await auth.confirmSignUp(
          username: userName, confirmationCode: oneTimecode);
    } on AuthException catch (e) {
      safePrint(e.message);
    }
    return null;
  }

  Future<SignOutResult?>? signOutUser() async {
    try {
      final auth = this.awsCognitoService!.getAuth();
      return await auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
    }
    return null;
  }

  Future<SignUpResult?>? signUpUser(
    String name,
    String email,
    String password,
    String phone,
    String dob,
    String gender
  ) async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.name: name,
        CognitoUserAttributeKey.email: email,
        CognitoUserAttributeKey.birthdate: dob,
        CognitoUserAttributeKey.phoneNumber: '+91$phone',
        CognitoUserAttributeKey.gender: gender,
        CognitoUserAttributeKey.givenName: name,
        CognitoUserAttributeKey.preferredUsername:email  
        // additional attributes as needed
      };
      final auth = this.awsCognitoService!.getAuth();
      return await auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
    } on AuthException catch (e) {
      safePrint(e.message);
    }
    return null;
  }
}

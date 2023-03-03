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
  Future<String> getAuthorization() {
    // TODO: implement getAuthorization
    throw UnimplementedError();
  }

  @override
  Future<bool> isUserAuthenticated() {
    // TODO: implement isUserAuthenticated
    throw UnimplementedError();
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
}

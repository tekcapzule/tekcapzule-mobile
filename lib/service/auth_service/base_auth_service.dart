import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

abstract class BaseAuthenticationService {
  Future<SignOutResult?>? signOutUser();
  Future<SignUpResult?>? confirmUser(String userName, String oneTimecode);
  Future<SignInResult>? signInUser(String userName, String password);
  Future<bool> isUserAuthenticated();
  Future<String> getAuthorization();
}

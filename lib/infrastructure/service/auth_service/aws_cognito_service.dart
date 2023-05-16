import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tek_capsule/infrastructure/config/cognito_config.dart';

class AwsCognitoService {
  Future<void> addPlugin() async {
    try {
      final plugin = AmplifyAuthCognito();
      await Amplify.addPlugin(plugin);
    } on Exception catch (e) {
      safePrint('An error occurred while adding plugin: $e');
    }
  }

  Future<void> configure() async {
    try {
      await Amplify.configure(cognito_configurations);
    } on Exception catch (e) {
      safePrint('An error occurred while configuring Amplify: $e');
    }
  }

  AuthCategory getAuth() => Amplify.Auth;
}

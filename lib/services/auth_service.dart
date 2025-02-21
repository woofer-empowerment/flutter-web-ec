import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final userPool = CognitoUserPool(
    'ap-southeast-2_93zWhjax4', //ユーザープールIC
    'shc46q9de654enb85cdag02c3', //アプリクライアントID
  );

  Future<CognitoUserSession?> signIn(String email, String password) async {
    final user = CognitoUser(email, userPool);
    final authDetails = AuthenticationDetails(username: email, password: password);

    try {
      final session = await user.authenticateUser(authDetails);
      return session;
    } catch (e) {
      if (kDebugMode) print('SignIn Error: $e');
      return null;
    }
  }

  Future<bool> signUp(String email, String password) async {
    final userAttributes = [
      AttributeArg(name: 'email', value: email),
    ];

    try {
      await userPool.signUp(email, password, userAttributes: userAttributes);
      return true;
    } catch (e) {
      if (kDebugMode) print('SignUp Error: $e');
      return false;
    }
  }

  Future<void> signOut(CognitoUser user) async {
    await user.signOut();
  }
}

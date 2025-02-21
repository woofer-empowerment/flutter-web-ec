import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final userPool = CognitoUserPool(
    '', //ユーザープールIC
    '', //アプリクライアントID
  );

  CognitoUser? _currentUser;

  /// サインイン
  Future<CognitoUserSession?> signIn(String email, String password) async {
    _currentUser = CognitoUser(email, userPool);
    final authDetails = AuthenticationDetails(username: email, password: password);

    try {
      final session = await _currentUser!.authenticateUser(authDetails);
      return session;
    } catch (e) {
      if (kDebugMode) print('SignIn Error: $e');
      return null;
    }
  }

  /// サインアップ
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

  /// サインアウト
  Future<void> signOut() async {
    if (_currentUser != null) {
      await _currentUser!.signOut();
      _currentUser = null;
    }
  }

  /// ユーザ情報の取得
  CognitoUser? getCurrentUser() {
    return _currentUser;
  }
}

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_web_ec/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<CognitoUserSession?> signIn(String email, String password) {
    return _authService.signIn(email, password);
  }

  Future<bool> signUp(String email, String password) {
    return _authService.signUp(email, password);
  }

  Future<void> signOut() {
    return _authService.signOut();
  }

  bool isSignededIn() {
    return _authService.getCurrentUser() != null;
  }
}

import 'package:flutter_web_ec/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_ec/data/repositories/auth_repository.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final service = AuthService();
  return service;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthRepository(authService);
});

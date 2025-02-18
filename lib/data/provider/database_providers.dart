import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database_service.dart';
import '/data/repositories/product_repository.dart';

/// Driftデータベースへのアクセス用
final databaseServiceProvider = Provider<DatabaseService>((ref) {
  final service = DatabaseService();
  return service;
});

/// Driftデータベースの商品情報へのアクセス用
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final databaseService = ref.watch(databaseServiceProvider);
  return ProductRepository(databaseService.db);
});

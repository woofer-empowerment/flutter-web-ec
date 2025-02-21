import 'dart:async';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_ec/data/provider/auth_provider.dart';
import 'package:flutter_web_ec/data/repositories/auth_repository.dart';
import '../../data/database/database.dart';
import '../../data/provider/database_providers.dart';
import '/data/repositories/product_repository.dart';

final notFoundViewModelProvider = AsyncNotifierProvider<NotFoundViewModel, List<Product>>(() => NotFoundViewModel());

class NotFoundViewModel extends AsyncNotifier<List<Product>> {
  late final ProductRepository productRepository;
  late final AuthRepository authRepository;

  @override
  FutureOr<List<Product>> build() {
    productRepository = ref.watch(productRepositoryProvider);
    authRepository = ref.watch(authRepositoryProvider);
    return _loadItems();
  }

  Future<List<Product>> _loadItems() async {
    await Future.delayed(const Duration(milliseconds: 2000)); //サンプルとして読み込みを２秒間待つようにする
    final products = await productRepository.getAllProducts();
    if (products.length != 0) return products;

    //サンプル処理
    print("サンプル商品の追加");
    await productRepository.insertSampleProducts();
    return await productRepository.getAllProducts();
  }

  /// サインイン処理
  Future<bool> signIn(String email, String password) async {
    final session = await authRepository.signIn(email, password);
    return session != null;
  }

  /// サインアップ処理
  Future<bool> signUp(String email, String password) async {
    return await authRepository.signUp(email, password);
  }

  /// サインアウト処理
  Future<void> signOut() async {
    await authRepository.signOut();
  }

  /// ログイン状態のチェック
  bool isSignededIn() {
    return authRepository.isSignededIn();
  }
}

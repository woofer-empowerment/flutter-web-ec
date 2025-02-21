import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/database.dart';
import '../../data/provider/database_providers.dart';
import '/data/repositories/product_repository.dart';

final homeViewModelProvider = AsyncNotifierProvider<HomeViewModel, List<Product>>(() => HomeViewModel());

class HomeViewModel extends AsyncNotifier<List<Product>> {
  late final ProductRepository productRepository;

  @override
  FutureOr<List<Product>> build() {
    productRepository = ref.watch(productRepositoryProvider);
    return _loadItems();
  }

  Future<List<Product>> _loadItems() async {
    await Future.delayed(const Duration(milliseconds: 2000)); //サンプルとして読み込みを２秒間待つようにする
    final products = await productRepository.getAllProducts();
    if (products.length != 0) return products;

    //サンプル処理
    print("サンプル商品の追加１");
    await productRepository.insertSampleProducts();
    return await productRepository.getAllProducts();
  }
}

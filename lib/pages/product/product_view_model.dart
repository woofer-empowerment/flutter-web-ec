import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/database.dart';
import '../../data/provider/database_providers.dart';
import '/data/repositories/product_repository.dart';

final productViewModelProvider = AsyncNotifierProvider<ProductViewModel, List<Product>>(() => ProductViewModel());

class ProductViewModel extends AsyncNotifier<List<Product>> {
  late final ProductRepository productRepository;

  @override
  FutureOr<List<Product>> build() {
    productRepository = ref.watch(productRepositoryProvider);
    return _loadItems();
  }

  Future<List<Product>> _loadItems() async {
    return await productRepository.getAllProducts();
  }
}

//TODO: 実行前にHTMLヘッダーの設定を確認

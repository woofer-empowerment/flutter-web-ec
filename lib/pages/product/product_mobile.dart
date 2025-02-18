import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_view_model.dart';

class ProductMobile extends ConsumerWidget {
  const ProductMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text("商品詳細（モバイル）")),
      body: productState.when(
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(products[index].name),
            subtitle: Text("価格: ${products[index].price}円"),
          ),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("エラー: $err")),
      ),
    );
  }
}

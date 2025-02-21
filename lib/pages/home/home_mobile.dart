import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_ec/data/database/database.dart';
import 'package:go_router/go_router.dart';

class HomeMobile extends ConsumerWidget {
  final AsyncValue<List<Product>> homeState;
  const HomeMobile({super.key, required this.homeState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("商品一覧（モバイル）")),
      body: homeState.when(
        data: (products) => Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.go('/product/123'); // ✅ 商品詳細ページへ遷移
                },
                child: const Text('商品 123 の詳細へ'),
              ),
            ),
          ],
        ),
        /*
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(products[index].name),
            subtitle: Text("価格: ${products[index].price}円"),
          ),
        ),
        */
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("エラー: $err")),
      ),
    );
  }
}

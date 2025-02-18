import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'home_view_model.dart';

class HomeMobile extends ConsumerWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);

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

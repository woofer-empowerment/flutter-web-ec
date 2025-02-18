import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/pages/home/home_view_model.dart';

class HomeTablet extends ConsumerWidget {
  const HomeTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text("商品一覧（タブレット）")),
      body: homeState.when(
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

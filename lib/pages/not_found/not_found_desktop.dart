import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'not_found_view_model.dart';

class NotFoundDesktop extends ConsumerWidget {
  const NotFoundDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(notFoundViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text("404（デスクトップ）")),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'product_view_model.dart';

class ProductMobile extends ConsumerWidget {
  const ProductMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: Text("商品詳細（モバイル）")),
      body: productState.when(
        data: (products) {
          print('デバッグ2');
          return ListView.builder(
            //itemCount: products.length, //アイテムの数だけ繰り返す
            itemCount: 1, //1回だけに変更
            itemBuilder: (context, index) {
              print(index);
              final product = products[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 商品画像（背景色を設定）
                      Container(
                        color: Colors.grey[200], // 背景色を設定
                        width: double.infinity,
                        height: 500,
                        child: Image.asset(
                          'assets/images/sample/sample.jpg', // アセットのパスを使用
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 16.0),

                      // 商品名（見出し）
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      // 価格
                      Text(
                        "¥${NumberFormat('#,###').format(product.price)}",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.orange),
                      ),
                      // のこりの数
                      Text(
                        "のこり1つ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.teal),
                      ),
                      SizedBox(height: 16.0),
                      // 商品説明文見出し
                      Text(
                        '商品説明の見出し',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ), // 商品説明文
                      Text(
                        'どこで生れたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪な種族であったそうだ。',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("エラー: $err")),
      ),
    );
  }
}

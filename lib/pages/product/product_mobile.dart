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
          final product = products[0]; // 仮で最初の商品を取得
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 商品詳細カード
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.grey[200],
                          width: double.infinity,
                          height: 500,
                          child: Image.asset(
                            'assets/images/sample/sample.jpg',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          "サブタイトル", // サブタイトル
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.0, bottom: 8.0),
                          child: Text(
                            product.name, // 商品タイトル
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 30.0),

                        // 金額 + 残り個数

                        Text(
                          "¥${NumberFormat('#,###').format(product.price)}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                          child: Text(
                            "残り${product.stock}個",
                            style: TextStyle(fontSize: 14, color: Colors.teal),
                          ),
                        ),

                        SizedBox(height: 16.0),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                          child: Text(
                            '商品説明の見出し',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                        Text(
                          'どこで生れたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: 60.0),
                      ],
                    ),
                  ),
                ),

                // 「他の商品」セクション（背景をグレーに）
                Container(
                  color: Colors.grey[400], // 背景をグレーに
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 16),
                        child: Text(
                          "他の商品",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 8.0),

                      // 横スクロール可能な商品リスト
                      SizedBox(
                        height: 260, // 商品カードの高さに合わせる
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: 16.0, right: 8.0),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ProductCard(product: products[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("エラー: $err")),
      ),
    );
  }
}

// 商品カードウィジェット
class ProductCard extends StatelessWidget {
  final dynamic product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // 2枚しっかり見えて3枚目が少し見える幅
      child: Card(
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/sample/sample.jpg', // 画像のパス（仮）
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "サブタイトル", // ダミーテキストを指定
                style: TextStyle(fontSize: 12, color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "ここに商品名", // 商品名
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "¥${NumberFormat('#,###').format(product.price)}",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    //"残り${product.stock}個",
                    "残り3個",
                    style: TextStyle(fontSize: 12, color: Colors.teal),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

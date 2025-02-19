import 'package:drift/drift.dart';
import '../database/database.dart';

class ProductRepository {
  final AppDatabase _db;

  ProductRepository(this._db);

  /// ローカルDB上の商品情報の取得
  Future<List<Product>> getAllProducts() async {
    return await _db.select(_db.products).get();
  }

  /// ローカルDB上の商品情報の追加
  Future<void> insertProduct(Product product) async {
    await _db.into(_db.products).insert(product);
  }

  /// ローカルDB上の商品情報の更新
  Future<void> updateProduct(Product product) async {
    await _db.update(_db.products).replace(product);
  }

  /// ローカルDB上の商品情報の削除
  Future<void> deleteProduct(int id) async {
    await (_db.delete(_db.products)..where((table) => table.id.equals(id))).go();
  }

  /// ローカルDB上の商品情報サンプルを構築
  Future<void> insertSampleProducts() async {
    await _db.batch((batch) {
      batch.insertAll(
        _db.products,
        [
          ProductsCompanion(
            productId: Value("p1234"),
            name: Value("これが商品名1234です"),
            description: Value("ここに商品説明文が入ります。ここに商品説明文が入ります。ここに商品説明文が入ります。"),
            price: Value(15000),
            stock: Value(15),
            category: Value("商品カテゴリA"),
            imageJson: Value([]),
            createdAt: Value(DateTime(2025, 1, 1)),
            updatedAt: Value(DateTime(2025, 1, 10)),
          ),
          ProductsCompanion(
            productId: Value("p2345"),
            name: Value("これが商品名2345です"),
            description: Value("ここに商品説明文が入ります。ここに商品説明文が入ります。ここに商品説明文が入ります。"),
            price: Value(2000),
            stock: Value(0),
            category: Value("商品カテゴリA"),
            imageJson: Value([]),
            createdAt: Value(DateTime(2024, 12, 20)),
            updatedAt: Value(DateTime(2024, 12, 20)),
          ),
          ProductsCompanion(
            productId: Value("p3456"),
            name: Value("これが商品名3456です"),
            description: Value("ここに商品説明文が入ります。ここに商品説明文が入ります。ここに商品説明文が入ります。"),
            price: Value(320000),
            stock: Value(3),
            category: Value("商品カテゴリA"),
            imageJson: Value([]),
            createdAt: Value(DateTime(2024, 10, 10)),
            updatedAt: Value(DateTime(2024, 11, 15)),
          ),
        ],
      );
    });
  }
}

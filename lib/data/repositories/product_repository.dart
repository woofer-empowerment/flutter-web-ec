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
}

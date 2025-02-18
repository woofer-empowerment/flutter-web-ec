import 'dart:convert';
import 'package:drift/drift.dart';

/// 商品情報（Driftテーブル）
class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productId => text().withLength(min: 1, max: 50)();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  RealColumn get price => real().withDefault(Constant(0.0))();
  IntColumn get stock => integer().withDefault(Constant(0))();
  TextColumn get category => text().nullable()();
  TextColumn get imageJson => text().map(const ImagesConverter())();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
}

/// String型リスト を JSON で保存するためのコンバータ
class ImagesConverter extends TypeConverter<List<String>, String> {
  const ImagesConverter();

  /// JSON　→　String型リスト
  @override
  List<String> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List<dynamic>).map((e) => e as String).toList();
  }

  /// String型リスト →　JSON
  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}

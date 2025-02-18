import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'tables/product.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Products])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final result = await WasmDatabase.open(
      databaseName: 'app_db', //Web用のIndexedDB
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );
    return result.resolvedExecutor;
  });
}

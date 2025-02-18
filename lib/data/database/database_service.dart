import 'database.dart';

class DatabaseService {
  late final AppDatabase _database;

  DatabaseService() {
    _database = AppDatabase();
  }

  AppDatabase get db => _database;
}

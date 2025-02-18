import 'package:intl/intl.dart';

class Formatters {
  ///日付データをフォーマットする
  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}

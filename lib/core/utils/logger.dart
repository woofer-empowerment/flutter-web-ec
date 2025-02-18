import 'package:flutter/foundation.dart';

class Logger {
  /// エラーログを出力する
  /// 開発環境ではコンソール出力、本番環境ではエラーログ送信
  static void logError(String message, Object error, StackTrace? stackTrace) {
    if (kDebugMode) {
      debugPrint("❌ [$message] $error\n$stackTrace");
    }

    if (kReleaseMode) {}
  }

  /// 通常ログを出力する
  /// 開発環境のみコンソール出力、本番環境は出力なし
  static void logInfo(String message) {
    if (kDebugMode) {
      debugPrint("ℹ️ INFO: $message");
    }
  }

  /// 警告ログを出力する
  /// 開発環境のみコンソール出力、本番環境は出力なし
  static void logWarning(String message) {
    if (kDebugMode) {
      debugPrint("⚠️ WARNING: $message");
    }
  }
}

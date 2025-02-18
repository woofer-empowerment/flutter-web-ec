// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import '/core/theme/theme_provider.dart';
import '/core/router/router_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Flutter Web URL の#を消す
  usePathUrlStrategy();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  bool _isListenerRegistered = false;
  StreamSubscription? _browserBackListener;

  @override
  void initState() {
    super.initState();

    //ウィジェットの初期化完了後に、画面遷移リスナーの登録
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && kIsWeb) setupBrowserNavigationListener();
    });
  }

  @override
  void dispose() {
    _browserBackListener?.cancel();
    super.dispose();
  }

  setupBrowserNavigationListener() {
    if (_isListenerRegistered) return; //重複登録を防ぐ
    _isListenerRegistered = true;

    _browserBackListener = html.window.onPopState.listen((event) {
      final currentPath = html.window.location.pathname ?? '/';
      print("[Browser Back/Forward] Navigating to: $currentPath");

      if (currentPath.startsWith('/')) {
        //ref.read(routerProvider).push(currentPath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeProvider),
      routerConfig: ref.watch(routerProvider),
    );
  }
}

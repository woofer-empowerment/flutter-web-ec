// ignore: avoid_web_libraries_in_flutter
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/pages/home/home_page.dart';
import '/pages/product/product_page.dart';

final GoRouter appRouter = GoRouter(
  refreshListenable: GoRouterRefreshStream(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final productId = state.pathParameters['id']!;
        return ProductPage(productId: productId);
      },
    ),
  ],
);

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream() {
    html.window.onPopState.listen((event) {
      notifyListeners(); // GoRouter にリスナを通知して再レンダリング
    });
  }
}

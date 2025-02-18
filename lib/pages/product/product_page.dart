import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/layouts/responsive_layout.dart';
import '/pages/product/product_mobile.dart';
import '/pages/product/product_tablet.dart';
import '/pages/product/product_desktop.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobile: ProductMobile(),
        tablet: ProductTablet(),
        desktop: ProductDesktop(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../layouts/responsive_layout.dart';
import 'not_found_mobile.dart';
import 'not_found_tablet.dart';
import 'not_found_desktop.dart';

class NotFoundPage extends ConsumerWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobile: NotFoundMobile(),
        tablet: NotFoundTablet(),
        desktop: NotFoundDesktop(),
      ),
    );
  }
}

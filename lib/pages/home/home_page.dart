import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../layouts/responsive_layout.dart';
import 'home_mobile.dart';
import 'home_tablet.dart';
import 'home_desktop.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobile: HomeMobile(),
        tablet: HomeTablet(),
        desktop: HomeDesktop(),
      ),
    );
  }
}

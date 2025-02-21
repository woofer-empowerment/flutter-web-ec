import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../layouts/responsive_layout.dart';
import 'home_mobile.dart';
import 'home_tablet.dart';
import 'home_desktop.dart';
import 'home_view_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);
    return Scaffold(
      body: ResponsiveLayout(
        mobile: HomeMobile(homeState: homeState),
        tablet: HomeTablet(homeState: homeState),
        desktop: HomeDesktop(homeState: homeState),
      ),
    );
  }
}

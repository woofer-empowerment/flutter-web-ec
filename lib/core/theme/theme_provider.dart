import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/core/theme/app_theme.dart';

final themeProvider = StateProvider<ThemeData>((ref) => appTheme);

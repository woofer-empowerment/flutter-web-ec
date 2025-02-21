// typography.dart
import 'package:flutter/material.dart';

class AppTypography {
  static const double headingFontSize = 24.0;
  static const double subheadingFontSize = 18.0;
  static const double bodyFontSize = 14.0;
  static const double captionFontSize = 12.0;

  static const String fontFamily = 'Roboto'; // フォントファミリー（例）

  static TextStyle headingStyle = TextStyle(
    fontSize: headingFontSize,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  static TextStyle subheadingStyle = TextStyle(
    fontSize: subheadingFontSize,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  static TextStyle bodyStyle = TextStyle(
    fontSize: bodyFontSize,
    fontFamily: fontFamily,
  );

  static TextStyle captionStyle = TextStyle(
    fontSize: captionFontSize,
    fontFamily: fontFamily,
//    color: AppColors.textSecondaryColor,
  );
}

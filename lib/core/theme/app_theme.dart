import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme({
    required this.fontFamily,
    required this.mainColor,
  });

  final String fontFamily;
  final Color mainColor;

  ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: mainColor,
      brightness: Brightness.light,
    );

    return theme(colorScheme);
  }

  ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: mainColor,
      brightness: Brightness.dark,
    );

    return theme(colorScheme);
  }

  ThemeData theme(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: fontFamily,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}

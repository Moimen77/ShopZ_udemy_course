import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.primary,
    required this.secondary,
    required this.surface,
    required this.onSurface,
    required this.onsurfaceVariant,
  });

  final Color primary;
  final Color secondary;
  final Color surface;
  final Color onSurface;
  final Color onsurfaceVariant;
}

/// Helper class to define the actual color palettes
class AppPalettesColors {
  AppPalettesColors._();

  static const light = AppColors(
    primary: Color(0xff3669C9),
    secondary: Color(0xff808080),
    surface: Colors.white,
    onSurface: Colors.black,
    onsurfaceVariant: Color(0xff999999),
  );
  static const dark = AppColors(
    primary: Color(0xff3669C9),
    secondary: Color(0xff808080),
    surface: Colors.black,
    onSurface: Colors.white,
    onsurfaceVariant: Color(0xff999999),
  );
}

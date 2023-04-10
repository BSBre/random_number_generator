import 'package:flutter/material.dart';
import 'package:random_number_generator/style/typography.dart';

import 'colors.dart';

ThemeData lightTheme() {
  final colors = RandomColors.light();
  final typography = RandomTypography();

  final primary = colors.primary;
  if (primary == null) {
    throw Exception('Primary color cannot be null');
  }

  final scheme = ColorScheme.fromSeed(
    seedColor: primary,
    brightness: Brightness.light,
  ).copyWith(
    primary: colors.primary,
    background: colors.white,
  );

  final base = ThemeData.from(colorScheme: scheme);

  final theme = base.copyWith(
    extensions: [colors, typography],
    textTheme: base.textTheme.copyWith(
      headlineLarge: typography.headingXL?.copyWith(color: colors.black),
      headlineMedium: typography.headingL?.copyWith(color: colors.black),
    ),
  );

  return theme;
}

import 'package:flutter/material.dart';

class RandomTypography extends ThemeExtension<RandomTypography> {
  RandomTypography({
    this.headingXL = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 64.0,
    ),
    this.headingL = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 48.0,
    ),
  });

  final TextStyle? headingXL;
  final TextStyle? headingL;

  @override
  ThemeExtension<RandomTypography> copyWith({
    TextStyle? headingXL,
    TextStyle? headingL,
  }) {
    return RandomTypography(
      headingXL: headingXL ?? this.headingXL,
      headingL: headingL ?? this.headingL,
    );
  }

  @override
  ThemeExtension<RandomTypography> lerp(RandomTypography? other, double t) {
    return RandomTypography(
      headingXL: TextStyle.lerp(headingXL, other?.headingXL, t),
      headingL: TextStyle.lerp(headingL, other?.headingL, t),
    );
  }
}

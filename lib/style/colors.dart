import 'package:flutter/material.dart';

class RandomColors extends ThemeExtension<RandomColors> {
  final Color? primary;

  final Color? black;
  final Color? white;
  final Color? backgrounds;

  RandomColors({
    this.primary,
    this.black,
    this.white,
    this.backgrounds,
  });

  @override
  ThemeExtension<RandomColors> copyWith({
    Color? primary,
    Color? black,
    Color? white,
    Color? backgrounds,
  }) {
    return RandomColors(
      primary: primary ?? this.primary,
      black: black ?? this.black,
      white: white ?? this.white,
      backgrounds: backgrounds ?? this.backgrounds,
    );
  }

  @override
  ThemeExtension<RandomColors> lerp(
    covariant ThemeExtension<RandomColors>? other,
    double t,
  ) {
    if (other is! RandomColors) {
      return this;
    }

    return RandomColors(
      primary: Color.lerp(primary, other.primary, t),
      black: Color.lerp(black, other.black, t),
      white: Color.lerp(white, other.white, t),
      backgrounds: Color.lerp(backgrounds, other.backgrounds, t),
    );
  }

  factory RandomColors.light() => RandomColors(
        primary: const Color(0xFFFFFD0F),
        black: Colors.black,
        white: Colors.white,
        backgrounds: const Color(0xFFF7F8FA),
      );
}

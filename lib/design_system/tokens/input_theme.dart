import 'package:flutter/material.dart';

@immutable
class AppInputTheme extends ThemeExtension<AppInputTheme> {
  final double radius;
  final double minHeight;
  final EdgeInsets contentPadding;
  final double borderWidth;
  final double focusedBorderWidth;

  const AppInputTheme({
    this.radius = 12,
    this.minHeight = 48,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderWidth = 1,
    this.focusedBorderWidth = 2,
  });

  @override
  AppInputTheme copyWith({
    double? radius,
    double? minHeight,
    EdgeInsets? contentPadding,
    double? borderWidth,
    double? focusedBorderWidth,
  }) =>
      AppInputTheme(
        radius: radius ?? this.radius,
        minHeight: minHeight ?? this.minHeight,
        contentPadding: contentPadding ?? this.contentPadding,
        borderWidth: borderWidth ?? this.borderWidth,
        focusedBorderWidth: focusedBorderWidth ?? this.focusedBorderWidth,
      );

  @override
  AppInputTheme lerp(ThemeExtension<AppInputTheme>? other, double t) => this;
}

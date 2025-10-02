import 'package:flutter/material.dart';

/// SUIT 폰트 기반 타입스케일 (이미지 스펙 반영)
class AppTypography {
  AppTypography._();

  // 공통: height 140~150%, letterSpacing -2%
  // Flutter는 letterSpacing이 px 단위이므로 fontSize * -0.02 로 계산.

  // Heading / 20 - EB
  static const TextStyle heading20EB = TextStyle(
    fontFamily: 'SUIT',
    fontWeight: FontWeight.w800, // ExtraBold
    fontSize: 20,
    height: 1.4, // 140%
    letterSpacing: -0.4, // -2% of 20
  );

  // Body / 16 - EB
  static const TextStyle body16EB = TextStyle(
    fontFamily: 'SUIT',
    fontWeight: FontWeight.w800,
    fontSize: 16,
    height: 1.5, // 150%
    letterSpacing: -0.32, // -2% of 16
  );

  // Body / 16 - M
  static const TextStyle body16M = TextStyle(
    fontFamily: 'SUIT',
    fontWeight: FontWeight.w500, // Medium
    fontSize: 16,
    height: 1.5,
    letterSpacing: -0.32,
  );

  // Body / 16 - B (Bold)
  static const TextStyle body16B = TextStyle(
    fontFamily: 'SUIT',
    fontWeight: FontWeight.w700, // Bold
    fontSize: 16,
    height: 1.5,
    letterSpacing: -0.32,
  );

  // Body1 Bold (alias for body16B)
  static const TextStyle body1Bold = body16B;

  // Body / 14 - EB
  static const TextStyle body14EB = TextStyle(
    fontFamily: 'SUIT',
    fontWeight: FontWeight.w800,
    fontSize: 14,
    height: 1.5,
    letterSpacing: -0.28, // -2% of 14
  );

  // Body / 14 - B
  static const TextStyle body14B = TextStyle(
    fontFamily: 'SUIT',
    fontWeight: FontWeight.w700, // Bold
    fontSize: 14,
    height: 1.5,
    letterSpacing: -0.28,
  );

  // Body / 14 - M
  static const TextStyle body14M = TextStyle(
    fontFamily: 'SUIT',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.5,
    letterSpacing: -0.28,
  );

  // Caption / 12 - EB
  static const TextStyle caption12EB = TextStyle(
    fontFamily: 'SUIT',
    fontWeight: FontWeight.w800,
    fontSize: 12,
    height: 1.5,
    letterSpacing: -0.24, // -2% of 12
  );

  // Caption / 12 - M
  static const TextStyle caption12M = TextStyle(
    fontFamily: 'SUIT',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.5,
    letterSpacing: -0.24,
  );

  /// Flutter TextTheme로 매핑 (원하는 슬롯에 주입)
  static TextTheme toTextTheme(TextTheme base) => base.copyWith(
        displaySmall: heading20EB, // 헤딩
        titleMedium: body16EB, // 굵은 본문 16
        bodyLarge: body16M, // 일반 본문 16
        bodyMedium: body14M, // 일반 본문 14
        bodySmall: body14B, // 굵은 본문 14
        labelLarge: caption12EB, // 캡션 12 EB
        labelMedium: caption12M, // 캡션 12 M
      );
}

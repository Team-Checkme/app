import 'package:flutter/material.dart';

import 'app_typography.dart';
// import 'app_typography.dart'; // 위 클래스 파일

final ThemeData lightTheme = ThemeData(
  fontFamily: 'SUIT',
  textTheme: AppTypography.toTextTheme(ThemeData.light().textTheme),
  // colorScheme 등은 기존 설정 사용
);

final ThemeData darkTheme = ThemeData(
  fontFamily: 'SUIT',
  textTheme: AppTypography.toTextTheme(ThemeData.dark().textTheme),
);

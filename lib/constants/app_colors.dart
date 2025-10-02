import 'package:flutter/material.dart';

/// App 전체에서 사용하는 컬러 팔레트
class AppColors {
  AppColors._(); // static 전용

  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // ===== Blue (100~800) =====
  static const Color blue100 = Color(0xFFECF4FB);
  static const Color blue200 = Color(0xFFD9ECFC);
  static const Color blue300 = Color(0xFFB4DBFC);
  static const Color blue400 = Color(0xFF59B3FF);
  static const Color blue500 = Color(0xFF328FEE);
  static const Color blue600 = Color(0xFF0866CA);
  static const Color blue700 = Color(0xFF0F4383);
  static const Color blue800 = Color(0xFF18365E);

  // ===== Gray (50,100,200,300,400,500,600,700,800,900) =====
  static const Color gray50 = Color(0xFFF1F4F7);
  static const Color gray100 = Color(0xFFF1F4F7);
  static const Color gray200 = Color(0xFFE1E5EA);
  static const Color gray300 = Color(0xFFBDC7D1);
  static const Color gray400 = Color(0xFF8C96A2);
  static const Color gray500 = Color(0xFF8C96A2);
  static const Color gray600 = Color(0xFF616977);
  static const Color gray700 = Color(0xFF616977);
  static const Color gray800 = Color(0xFF3F4654);
  static const Color gray900 = Color(0xFF191F2A);

  // ===== Primary Colors =====
  static const Color primary = Color(0xFF59B3FF);

  // ===== 상태 색상 =====
  static const Color error = Color(0xFFFA6C6C);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // ===== 체크리스트 컬러셋 =====
  static const Color check01 = Color(0xFFE6F1FF); // 연한 파란색
  static const Color check02 = Color(0xFFD9F1F2); // 연한 청록색
  static const Color check03 = Color(0xFFFFECEC); // 연한 빨간색
  static const Color check04 = Color(0xFFE8EEFE); // 연한 보라색
  static const Color check05 = Color(0xFFFFF9EC); // 연한 노란색
  static const Color check06 = Color(0xFFF6E8FE); // 연한 보라색

  /// 체크리스트 색상 배열 (순서대로)
  static const List<Color> checkColors = [
    check01,
    check02,
    check03,
    check04,
    check05,
    check06,
  ];

  /// 인덱스에 따라 체크리스트 색상 반환 (6개를 넘어가면 반복)
  static Color getCheckColorByIndex(int index) {
    return checkColors[index % checkColors.length];
  }

  /// MaterialColor (ThemeData.primarySwatch 등에 사용)
  static MaterialColor blueSwatch = const MaterialColor(
    0xFF59B3FF, // 대표 컬러(=400)
    const <int, Color>{
      100: blue100,
      200: blue200,
      300: blue300,
      400: blue400,
      500: blue500,
      600: blue600,
      700: blue700,
      800: blue800,
    },
  );

  /// 회색 스와치 (비표준 단계 포함)
  static MaterialColor graySwatch = const MaterialColor(
    0xFF8C96A2, // 대표 컬러(=500)
    const <int, Color>{
      100: gray100,
      200: gray200,
      300: gray300,
      500: gray500,
      700: gray700,
      800: gray800,
      900: gray900,
    },
  );
}

/// 톤별 네임스페이스(가독성/자동완성 편의용)
class Blue {
  Blue._();
  static const c100 = AppColors.blue100;
  static const c200 = AppColors.blue200;
  static const c300 = AppColors.blue300;
  static const c400 = AppColors.blue400;
  static const c500 = AppColors.blue500;
  static const c600 = AppColors.blue600;
  static const c700 = AppColors.blue700;
  static const c800 = AppColors.blue800;
}

class Gray {
  Gray._();
  static const c100 = AppColors.gray100;
  static const c200 = AppColors.gray200;
  static const c300 = AppColors.gray300;
  static const c500 = AppColors.gray500;
  static const c700 = AppColors.gray700;
  static const c800 = AppColors.gray800;
  static const c900 = AppColors.gray900;
}

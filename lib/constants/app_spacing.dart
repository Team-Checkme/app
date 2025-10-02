class AppSpacing {
  // 기본 spacing 토큰 (사양서 기준)
  static const double s4 = 4;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s24 = 24;
  static const double s32 = 32;
  static const double s40 = 40;

  // 기존 호환성 유지
  static const double xs = s4;
  static const double sm = s8;
  static const double md = s16;
  static const double lg = s24;
  static const double xl = s32;
}

/// Grid 시스템 상수 (사양서 기준)
class AppGrid {
  AppGrid._(); // static 전용

  // 5컬럼 그리드 시스템
  static const int columns = 5;
  static const double gutter = 12;
  static const double pageMargin = 16;

  // 상단 안전영역 (iPhone X 기준)
  static const double statusBarHeight = 44;

  // 컬럼 너비 계산 헬퍼
  static double getColumnWidth(double screenWidth) {
    final usableWidth = screenWidth - 2 * pageMargin;
    return (usableWidth - (columns - 1) * gutter) / columns;
  }
}

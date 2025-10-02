import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/design_system/widgets/safe_scroll_area.dart';

/// 체크노트 상세 레이아웃 컴포넌트
/// - 상세보기용 레이아웃 (모든 액션 활성화)
/// - 체크노트 상세 페이지에서 사용
class ChecknoteDetailLayout extends StatelessWidget {
  const ChecknoteDetailLayout({
    super.key,
    required this.navbar,
    required this.hero,
    required this.tabMenu,
    required this.content,
    this.backgroundColor = AppColors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
  });

  /// 네비게이션 바
  final Widget navbar;

  /// 히어로 섹션
  final Widget hero;

  /// 탭 메뉴
  final Widget tabMenu;

  /// 콘텐츠 영역
  final Widget content;

  /// 배경색
  final Color backgroundColor;

  /// 좌우 패딩
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // 네비게이션 바
          navbar,

          // 히어로 섹션
          Padding(
            padding: padding,
            child: hero,
          ),

          // 탭 메뉴
          tabMenu,

          // 콘텐츠 영역
          Expanded(
            child: SafeScrollArea(
              padding: padding,
              child: content,
            ),
          ),
        ],
      ),
    );
  }
}

/// 체크노트 상세 레이아웃 변형들
class ChecknoteDetailLayoutVariants {
  /// 기본 체크노트 상세 레이아웃
  static ChecknoteDetailLayout default_({
    Key? key,
    required Widget navbar,
    required Widget hero,
    required Widget tabMenu,
    required Widget content,
  }) {
    return ChecknoteDetailLayout(
      key: key,
      navbar: navbar,
      hero: hero,
      tabMenu: tabMenu,
      content: content,
    );
  }

  /// 패딩이 없는 체크노트 상세 레이아웃
  static ChecknoteDetailLayout noPadding({
    Key? key,
    required Widget navbar,
    required Widget hero,
    required Widget tabMenu,
    required Widget content,
  }) {
    return ChecknoteDetailLayout(
      key: key,
      navbar: navbar,
      hero: hero,
      tabMenu: tabMenu,
      content: content,
      padding: EdgeInsets.zero,
    );
  }

  /// 커스텀 패딩이 있는 체크노트 상세 레이아웃
  static ChecknoteDetailLayout customPadding({
    Key? key,
    required Widget navbar,
    required Widget hero,
    required Widget tabMenu,
    required Widget content,
    required EdgeInsets padding,
  }) {
    return ChecknoteDetailLayout(
      key: key,
      navbar: navbar,
      hero: hero,
      tabMenu: tabMenu,
      content: content,
      padding: padding,
    );
  }
}

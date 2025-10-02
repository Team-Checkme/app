import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/design_system/widgets/safe_scroll_area.dart';

/// 체크노트 미리보기 레이아웃 컴포넌트
/// - 미리보기용 레이아웃 (모든 액션 비활성화)
/// - 체크노트 생성 step3에서 사용
class ChecknotePreviewLayout extends StatelessWidget {
  const ChecknotePreviewLayout({
    super.key,
    required this.navbar,
    required this.hero,
    required this.tabMenu,
    required this.content,
    required this.bottomActions,
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

  /// 하단 액션 버튼들
  final Widget bottomActions;

  /// 배경색
  final Color backgroundColor;

  /// 좌우 패딩
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              // 네비게이션 바 (SafeArea 적용)
              SafeArea(
                bottom: false,
                child: navbar,
              ),

              // 스크롤 가능한 전체 콘텐츠
              Expanded(
                child: SafeScrollArea(
                  padding: padding,
                  child: Column(
                    children: [
                      // 히어로 섹션
                      hero,

                      // 탭 메뉴
                      tabMenu,

                      // 콘텐츠 영역
                      content,
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 하단 액션 버튼들
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: bottomActions,
          ),
        ],
      ),
    );
  }
}

/// 체크노트 미리보기 레이아웃 변형들
class ChecknotePreviewLayoutVariants {
  /// 기본 체크노트 미리보기 레이아웃
  static ChecknotePreviewLayout default_({
    Key? key,
    required Widget navbar,
    required Widget hero,
    required Widget tabMenu,
    required Widget content,
    required Widget bottomActions,
  }) {
    return ChecknotePreviewLayout(
      key: key,
      navbar: navbar,
      hero: hero,
      tabMenu: tabMenu,
      content: content,
      bottomActions: bottomActions,
    );
  }

  /// 패딩이 없는 체크노트 미리보기 레이아웃
  static ChecknotePreviewLayout noPadding({
    Key? key,
    required Widget navbar,
    required Widget hero,
    required Widget tabMenu,
    required Widget content,
    required Widget bottomActions,
  }) {
    return ChecknotePreviewLayout(
      key: key,
      navbar: navbar,
      hero: hero,
      tabMenu: tabMenu,
      content: content,
      bottomActions: bottomActions,
      padding: EdgeInsets.zero,
    );
  }
}

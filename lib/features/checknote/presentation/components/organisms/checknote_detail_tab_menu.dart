import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_typography.dart';

/// 체크노트 상세 탭 메뉴 컴포넌트
/// - 홈, 히스토리, 대시보드, 참여자, 참여신청 탭들을 포함
class ChecknoteDetailTabMenu extends StatelessWidget {
  const ChecknoteDetailTabMenu({
    super.key,
    required this.tabs,
    required this.activeIndex,
    required this.onChanged,
    this.backgroundColor = AppColors.white,
    this.activeColor = AppColors.gray900, // #191F2A
    this.inactiveColor = AppColors.gray600, // #616977
    this.indicatorColor = AppColors.gray900,
    this.height = 48, // Figma 디자인에 맞게 높이 증가
    this.padding = EdgeInsets.zero,
  });

  /// 탭 리스트
  final List<String> tabs;

  /// 활성 탭 인덱스
  final int activeIndex;

  /// 탭 변경 콜백
  final ValueChanged<int> onChanged;

  /// 배경색
  final Color backgroundColor;

  /// 활성 탭 색상
  final Color activeColor;

  /// 비활성 탭 색상
  final Color inactiveColor;

  /// 인디케이터 색상
  final Color indicatorColor;

  /// 높이
  final double height;

  /// 좌우 패딩
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: const Border(
          bottom: BorderSide(
            color: AppColors.gray200,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          for (int i = 0; i < tabs.length; i++) ...[
            Expanded(
              child: _buildTab(i),
            ),
          ],
        ],
      ),
    );
  }

  /// 개별 탭 위젯
  Widget _buildTab(int index) {
    final isActive = index == activeIndex;

    return GestureDetector(
      onTap: () => onChanged(index),
      child: Container(
        height: height,
        padding: const EdgeInsets.fromLTRB(0, 9, 0, 0), // Figma 디자인에 맞게 복원
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? AppColors.black : AppColors.transparent,
                width: 3,
              ),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              tabs[index],
              style: AppTypography.body14B.copyWith(
                color: isActive ? activeColor : inactiveColor,
                fontWeight: isActive ? FontWeight.w800 : FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 체크노트 상세 탭 메뉴 변형들
class ChecknoteDetailTabMenuVariants {
  /// 기본 탭 메뉴
  static ChecknoteDetailTabMenu default_({
    Key? key,
    required List<String> tabs,
    required int activeIndex,
    required ValueChanged<int> onChanged,
  }) {
    return ChecknoteDetailTabMenu(
      key: key,
      tabs: tabs,
      activeIndex: activeIndex,
      onChanged: onChanged,
    );
  }

  /// 체크 상세 전용 탭 메뉴
  static ChecknoteDetailTabMenu checkDetail({
    Key? key,
    required int activeIndex,
    required ValueChanged<int> onChanged,
  }) {
    return ChecknoteDetailTabMenu(
      key: key,
      tabs: const ['홈', '히스토리', '대시보드', '참여자', '참여신청'],
      activeIndex: activeIndex,
      onChanged: onChanged,
    );
  }

  /// 간소화된 탭 메뉴
  static ChecknoteDetailTabMenu simple({
    Key? key,
    required List<String> tabs,
    required int activeIndex,
    required ValueChanged<int> onChanged,
  }) {
    return ChecknoteDetailTabMenu(
      key: key,
      tabs: tabs,
      activeIndex: activeIndex,
      onChanged: onChanged,
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}

import 'package:app/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/constants/app_typography.dart';
import 'package:flutter_svg/svg.dart';
import 'app_button.dart';

/// 체크리스트 컬러 카드 컴포넌트
/// - 6가지 색상 변형 지원 (check01 ~ check06)
/// - 체크 항목을 표시하는 카드 형태
/// - isAvailable에 따라 체크하기 버튼 표시 여부 결정
class AppChecklistColorCard extends StatelessWidget {
  const AppChecklistColorCard({
    super.key,
    required this.title,
    this.colorVariant = ChecklistColorVariant.check01,
    this.isCompleted = false,
    this.isAvailable = false,
    this.schedule,
    this.time,
    this.checkSchedule,
    this.remainingTime,
    this.onTap,
    this.onCheck,
    this.padding = const EdgeInsets.all(AppSpacing.s16),
    this.borderRadius = 16,
  });

  /// 체크 항목 제목
  final String title;

  /// 색상 변형
  final ChecklistColorVariant colorVariant;

  /// 완료 상태
  final bool isCompleted;

  /// 체크 가능 상태 (체크하기 버튼 표시 여부)
  final bool isAvailable;

  /// 스케줄 정보 (예: "주 3회")
  final String? schedule;

  /// 시간 정보 (예: "22:00-23:00")
  final String? time;

  /// 체크 일정 (예: "25. 7. 9 22:00±1시간")
  final String? checkSchedule;

  /// 남은 시간 (예: "05:34:39")
  final String? remainingTime;

  /// 탭 콜백
  final VoidCallback? onTap;

  /// 체크하기 콜백
  final VoidCallback? onCheck;

  /// 내부 패딩
  final EdgeInsets padding;

  /// 모서리 둥글기
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = _getColorScheme(colorVariant);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: isCompleted
                ? colorScheme.completedBackground
                : colorScheme.background,
            borderRadius: BorderRadius.circular(borderRadius),
            border: isCompleted
                ? Border.all(color: colorScheme.completedBorder, width: 1)
                : null,
          ),
          child: isAvailable
              ? _buildAvailableLayout(colorScheme)
              : _buildSimpleLayout(colorScheme),
        ),
      ),
    );
  }

  /// 체크 가능한 레이아웃 (복잡한 구조)
  Widget _buildAvailableLayout(ColorScheme colorScheme) {
    return Column(
      children: [
        // 상단: 스케줄 정보 + 하트 아이콘
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 스케줄 정보
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.s8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (schedule != null) ...[
                    Text(
                      schedule!,
                      style: AppTypography.caption12EB.copyWith(
                        color: const Color(0xFF18365E),
                      ),
                    ),
                    const SizedBox(width: 4),
                  ],
                  if (time != null)
                    Text(
                      time!,
                      style: AppTypography.caption12M.copyWith(
                        color: const Color(0xFF18365E).withOpacity(0.6),
                      ),
                    ),
                ],
              ),
            ),
            // 하트 아이콘
            SvgPicture.asset(
              AppIcons.heartFilled,
              width: 24,
              height: 24,
              colorFilter:
                  const ColorFilter.mode(AppColors.blue700, BlendMode.srcIn),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.s16),

        // 중간: 제목 + 체크 일정 + 별 아이콘
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.body1Bold.copyWith(
                      color: colorScheme.text,
                    ),
                  ),
                  if (checkSchedule != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '체크 일정 : $checkSchedule',
                          style: AppTypography.body14M.copyWith(
                            color: const Color(0xFF3F4654).withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.star_outline,
                          color: const Color(0xFF3F4654).withOpacity(0.8),
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.s16),

        // 하단: 체크하기 버튼
        AppButtonX.primary(
          text: '체크하기',
          width: double.infinity,
          height: 48,
          subText: remainingTime != null ? '남은 시간 : $remainingTime' : null,
          subTextAlignment: SubTextAlignment.horizontal,
          onPressed: onCheck,
          expand: true,
        ),
      ],
    );
  }

  /// 단순한 레이아웃 (기존 구조)
  Widget _buildSimpleLayout(ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTypography.body1Bold.copyWith(
              color: isCompleted ? colorScheme.completedText : colorScheme.text,
            ),
          ),
        ),
        if (isCompleted) ...[
          const SizedBox(width: AppSpacing.s8),
          Icon(
            Icons.check_circle,
            color: colorScheme.completedIcon,
            size: 20,
          ),
        ],
      ],
    );
  }

  /// 색상 변형에 따른 색상 스키마 반환
  ColorScheme _getColorScheme(ChecklistColorVariant variant) {
    switch (variant) {
      case ChecklistColorVariant.check01:
        return const ColorScheme(
          background: Color(0xFFE6F1FF), // 연한 파란색
          text: Color(0xFF191F2A),
          completedBackground: Color(0xFFE6F1FF),
          completedText: Color(0xFF191F2A),
          completedBorder: Color(0xFF4A90E2),
          completedIcon: Color(0xFF4A90E2),
        );
      case ChecklistColorVariant.check02:
        return const ColorScheme(
          background: Color(0xFFD9F1F2), // 연한 청록색
          text: Color(0xFF191F2A),
          completedBackground: Color(0xFFD9F1F2),
          completedText: Color(0xFF191F2A),
          completedBorder: Color(0xFF4ECDC4),
          completedIcon: Color(0xFF4ECDC4),
        );
      case ChecklistColorVariant.check03:
        return const ColorScheme(
          background: Color(0xFFFFECEC), // 연한 빨간색
          text: Color(0xFF191F2A),
          completedBackground: Color(0xFFFFECEC),
          completedText: Color(0xFF191F2A),
          completedBorder: Color(0xFFFF6B6B),
          completedIcon: Color(0xFFFF6B6B),
        );
      case ChecklistColorVariant.check04:
        return const ColorScheme(
          background: Color(0xFFE8EEFE), // 연한 보라색
          text: Color(0xFF191F2A),
          completedBackground: Color(0xFFE8EEFE),
          completedText: Color(0xFF191F2A),
          completedBorder: Color(0xFF9B59B6),
          completedIcon: Color(0xFF9B59B6),
        );
      case ChecklistColorVariant.check05:
        return const ColorScheme(
          background: Color(0xFFFFF9EC), // 연한 노란색
          text: Color(0xFF191F2A),
          completedBackground: Color(0xFFFFF9EC),
          completedText: Color(0xFF191F2A),
          completedBorder: Color(0xFFF39C12),
          completedIcon: Color(0xFFF39C12),
        );
      case ChecklistColorVariant.check06:
        return const ColorScheme(
          background: Color(0xFFF6E8FE), // 연한 분홍색
          text: Color(0xFF191F2A),
          completedBackground: Color(0xFFF6E8FE),
          completedText: Color(0xFF191F2A),
          completedBorder: Color(0xFFE91E63),
          completedIcon: Color(0xFFE91E63),
        );
    }
  }
}

/// 체크리스트 색상 변형 열거형
enum ChecklistColorVariant {
  check01,
  check02,
  check03,
  check04,
  check05,
  check06,
}

/// 색상 스키마 클래스
class ColorScheme {
  const ColorScheme({
    required this.background,
    required this.text,
    required this.completedBackground,
    required this.completedText,
    required this.completedBorder,
    required this.completedIcon,
  });

  final Color background;
  final Color text;
  final Color completedBackground;
  final Color completedText;
  final Color completedBorder;
  final Color completedIcon;
}

/// 체크리스트 컬러 카드 그룹 컴포넌트
/// - 여러 체크리스트 카드를 세로로 배치
/// - 각 카드 사이의 간격 조정
class AppChecklistColorCardGroup extends StatelessWidget {
  const AppChecklistColorCardGroup({
    super.key,
    required this.items,
    this.spacing = AppSpacing.s8,
    this.onItemTap,
  });

  final List<ChecklistItem> items;
  final double spacing;
  final ValueChanged<int>? onItemTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          AppChecklistColorCard(
            title: items[i].title,
            colorVariant: items[i].colorVariant,
            isCompleted: items[i].isCompleted,
            isAvailable: items[i].isAvailable,
            schedule: items[i].schedule,
            time: items[i].time,
            checkSchedule: items[i].checkSchedule,
            remainingTime: items[i].remainingTime,
            onTap: () => onItemTap?.call(i),
          ),
          if (i < items.length - 1) SizedBox(height: spacing),
        ],
      ],
    );
  }
}

/// 체크리스트 아이템 데이터 클래스
class ChecklistItem {
  const ChecklistItem({
    required this.title,
    required this.colorVariant,
    this.isCompleted = false,
    this.isAvailable = false,
    this.schedule,
    this.time,
    this.checkSchedule,
    this.remainingTime,
  });

  final String title;
  final ChecklistColorVariant colorVariant;
  final bool isCompleted;
  final bool isAvailable;
  final String? schedule;
  final String? time;
  final String? checkSchedule;
  final String? remainingTime;
}

import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/constants/app_typography.dart';
import 'package:app/design_system/widgets/app_checklist_color_card.dart';
import '../atoms/check_schedule_text.dart';

/// 체크 카드 컴포넌트
/// - 체크 항목 하나를 표시하는 카드
/// - 제목, 일정, 하트 아이콘, 체크 버튼 등을 포함
class CheckCard extends StatelessWidget {
  const CheckCard({
    super.key,
    required this.title,
    required this.schedule,
    this.isLiked = false,
    this.isCompleted = false,
    this.remainingTime,
    this.colorVariant = ChecklistColorVariant.check01,
    this.onLike,
    this.onCheck,
    this.padding = const EdgeInsets.all(AppSpacing.s16),
    this.borderRadius = 16,
  });

  /// 체크 항목 제목
  final String title;

  /// 체크 일정
  final String schedule;

  /// 좋아요 상태
  final bool isLiked;

  /// 완료 상태
  final bool isCompleted;

  /// 남은 시간 (선택사항)
  final String? remainingTime;

  /// 색상 변형
  final ChecklistColorVariant colorVariant;

  /// 좋아요 토글 콜백
  final VoidCallback? onLike;

  /// 체크 버튼 콜백
  final VoidCallback? onCheck;

  /// 내부 패딩
  final EdgeInsets padding;

  /// 모서리 둥글기
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: _getBackgroundColor(colorVariant),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상단: 주기/시간 정보와 하트 아이콘
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 주기/시간 정보
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '주 3회',
                      style: AppTypography.caption12EB.copyWith(
                        color: AppColors.blue800,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '22:00-23:00',
                      style: AppTypography.caption12M.copyWith(
                        color: AppColors.blue800.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              // 하트 아이콘
              GestureDetector(
                onTap: onLike,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? AppColors.blue700 : AppColors.gray600,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.s16),

          // 체크 항목 제목과 일정
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.body16EB.copyWith(
                  color: AppColors.gray900,
                ),
              ),
              const SizedBox(height: 4),
              CheckScheduleText(
                schedule: schedule,
                opacity: 0.8,
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.s16),

          // 체크 버튼
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onCheck,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.gray900,
                foregroundColor: AppColors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Column(
                children: [
                  Text(
                    '체크하기',
                    style: AppTypography.body14B.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  if (remainingTime != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      remainingTime!,
                      style: AppTypography.body14B.copyWith(
                        color: AppColors.gray500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 색상 변형에 따른 배경색 반환
  Color _getBackgroundColor(ChecklistColorVariant variant) {
    switch (variant) {
      case ChecklistColorVariant.check01:
        return AppColors.check01;
      case ChecklistColorVariant.check02:
        return AppColors.check02;
      case ChecklistColorVariant.check03:
        return AppColors.check03;
      case ChecklistColorVariant.check04:
        return AppColors.check04;
      case ChecklistColorVariant.check05:
        return AppColors.check05;
      case ChecklistColorVariant.check06:
        return AppColors.check06;
    }
  }
}

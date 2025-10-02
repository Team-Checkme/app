import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_typography.dart';

/// 체크 카운트 배지 컴포넌트
/// - "NN/NN" 형태의 진행률 표시
/// - 히어로 이미지 위에 오버레이로 표시
class CheckCountBadge extends StatelessWidget {
  const CheckCountBadge({
    super.key,
    required this.currentCount,
    required this.totalCount,
    this.backgroundColor = const Color(0x99000000), // rgba(0, 0, 0, 0.6)
    this.textColor = AppColors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    this.borderRadius = 4,
  });

  /// 현재 완료된 체크 수
  final int currentCount;

  /// 전체 체크 수
  final int totalCount;

  /// 배경색
  final Color backgroundColor;

  /// 텍스트 색상
  final Color textColor;

  /// 내부 패딩
  final EdgeInsets padding;

  /// 모서리 둥글기
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        '$currentCount/$totalCount',
        style: AppTypography.caption12M.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}

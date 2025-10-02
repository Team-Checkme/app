import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_typography.dart';

/// 체크 일정 텍스트 컴포넌트
/// - "체크 일정: 25. 7. 9 22:00±1시간" 형태의 일정 표시
class CheckScheduleText extends StatelessWidget {
  const CheckScheduleText({
    super.key,
    required this.schedule,
    this.textColor = AppColors.gray800,
    this.opacity = 0.8,
    this.style,
  });

  /// 일정 텍스트
  final String schedule;

  /// 텍스트 색상
  final Color textColor;

  /// 투명도
  final double opacity;

  /// 커스텀 텍스트 스타일
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Text(
        '체크 일정: $schedule',
        style: style ??
            AppTypography.body14M.copyWith(
              color: textColor,
            ),
      ),
    );
  }
}

/// 체크 일정 텍스트 빌더
class CheckScheduleTextBuilder {
  /// 날짜와 시간으로 일정 텍스트 생성
  static String buildScheduleText({
    required DateTime date,
    required String time,
    String? timeRange,
  }) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    if (timeRange != null) {
      return '$month. $day $time$timeRange';
    } else {
      return '$month. $day $time';
    }
  }

  /// 현재 시간 기준으로 남은 시간 계산
  static String buildRemainingTimeText(DateTime targetTime) {
    final now = DateTime.now();
    final difference = targetTime.difference(now);

    if (difference.isNegative) {
      return '시간 만료';
    }

    final hours = difference.inHours;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;

    return '남은 시간: ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

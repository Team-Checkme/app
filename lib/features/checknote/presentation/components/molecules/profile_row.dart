import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_typography.dart';

/// 프로필 행 컴포넌트
/// - 마스터 정보와 참여자 수를 표시
/// - "마스터", "이름", "참여자 수" 형태로 구성
class ProfileRow extends StatelessWidget {
  const ProfileRow({
    super.key,
    required this.masterName,
    required this.participantCount,
    required this.maxParticipants,
    this.masterLabel = '마스터',
    this.participantLabel = '참여 중',
    this.maxLabel = '최대',
    this.textColor = AppColors.gray600,
    this.dotColor = AppColors.gray300,
    this.gap = 4,
  });

  /// 마스터 이름
  final String masterName;

  /// 현재 참여자 수
  final int participantCount;

  /// 최대 참여자 수
  final int maxParticipants;

  /// 마스터 라벨
  final String masterLabel;

  /// 참여자 라벨
  final String participantLabel;

  /// 최대 라벨
  final String maxLabel;

  /// 텍스트 색상
  final Color textColor;

  /// 구분점 색상
  final Color dotColor;

  /// 요소들 사이 간격
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 마스터 라벨
        Text(
          masterLabel,
          style: AppTypography.body14B.copyWith(
            color: textColor,
          ),
        ),

        SizedBox(width: gap),

        // 마스터 이름
        Text(
          masterName,
          style: AppTypography.body14M.copyWith(
            color: textColor,
          ),
        ),

        SizedBox(width: gap),

        // 구분점
        Container(
          width: 3,
          height: 3,
          decoration: BoxDecoration(
            color: dotColor.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
        ),

        SizedBox(width: gap),

        // 참여자 수
        Text(
          '$participantCount명 $participantLabel($maxLabel $maxParticipants명)',
          style: AppTypography.body14M.copyWith(
            color: textColor,
          ),
        ),
      ],
    );
  }
}

/// 프로필 행 변형들
class ProfileRowVariants {
  /// 기본 프로필 행
  static ProfileRow default_({
    Key? key,
    required String masterName,
    required int participantCount,
    required int maxParticipants,
  }) {
    return ProfileRow(
      key: key,
      masterName: masterName,
      participantCount: participantCount,
      maxParticipants: maxParticipants,
    );
  }

  /// 간소화된 프로필 행 (참여자 수만 표시)
  static ProfileRow simple({
    Key? key,
    required String masterName,
    required int participantCount,
    required int maxParticipants,
  }) {
    return ProfileRow(
      key: key,
      masterName: masterName,
      participantCount: participantCount,
      maxParticipants: maxParticipants,
      masterLabel: '',
      participantLabel: '참여',
      maxLabel: '최대',
    );
  }
}

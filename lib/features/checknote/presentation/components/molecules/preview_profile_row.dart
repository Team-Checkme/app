import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_typography.dart';
import 'package:app/constants/app_spacing.dart';

class PreviewProfileRow extends StatelessWidget {
  const PreviewProfileRow({
    super.key,
    required this.ownerName,
    required this.participantCount,
  });

  final String ownerName;
  final int participantCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(radius: 16, backgroundColor: AppColors.gray200),
        const SizedBox(width: AppSpacing.s8),
        Expanded(
          child: Text(
            ownerName,
            style: AppTypography.body14B.copyWith(color: AppColors.gray900),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: AppSpacing.s4),
        Text(
          '$participantCount명 참여중',
          style: AppTypography.caption12M.copyWith(color: AppColors.gray700),
        ),
      ],
    );
  }
}

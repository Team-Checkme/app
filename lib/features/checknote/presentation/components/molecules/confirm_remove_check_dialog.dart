import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_typography.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/design_system/widgets/app_button.dart';

/// 체크 제거 확인 공용 모달 (Molecule)
Future<bool?> showConfirmRemoveCheckDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.24),
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titlePadding: const EdgeInsets.only(
          top: AppSpacing.s16,
          left: AppSpacing.s16,
          right: AppSpacing.s16,
        ),
        contentPadding: const EdgeInsets.all(AppSpacing.s16),
        title: Text(
          '추가한 체크를 제거하시겠습니까?',
          textAlign: TextAlign.center,
          style: AppTypography.body16EB.copyWith(color: AppColors.gray900),
        ),
        content: Text(
          '제거된 체크는 저장되지 않습니다.',
          textAlign: TextAlign.center,
          style: AppTypography.body14M.copyWith(color: AppColors.gray800),
        ),
        actionsPadding: const EdgeInsets.fromLTRB(
            AppSpacing.s16, 0, AppSpacing.s16, AppSpacing.s16),
        actions: [
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    type: ButtonType.secondaryB,
                    text: '취소',
                    height: 48,
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ),
                const SizedBox(width: AppSpacing.s8),
                Expanded(
                  child: AppButton(
                    type: ButtonType.primary,
                    text: '제거',
                    height: 48,
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

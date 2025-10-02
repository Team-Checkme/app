import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_typography.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/design_system/widgets/app_button.dart';

/// Step3 싱글 체크 전용 에디터 (Molecule)
class SingleCheckEditor extends StatelessWidget {
  const SingleCheckEditor({
    super.key,
    required this.hasCheck,
    required this.onAdd,
    required this.onRemove,
  });

  final bool hasCheck;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('체크 추가',
            style: AppTypography.body16EB.copyWith(color: AppColors.gray900)),
        const SizedBox(height: AppSpacing.s8),
        Text(
          '하나의 체크만 추가 가능하며,\n체크는 체크 노트가 만들어진 후에도 추가 가능합니다.',
          style: AppTypography.body14M.copyWith(color: AppColors.gray800),
        ),
        const SizedBox(height: AppSpacing.s16),
        if (!hasCheck)
          AppButton(
            type: ButtonType.text,
            text: '체크 추가하기',
            icon: const Icon(Icons.add, size: 16, color: AppColors.gray700),
            onPressed: onAdd,
            height: 48,
            width: double.infinity,
          )
        else
          Container(
            padding: const EdgeInsets.all(AppSpacing.s16),
            decoration: BoxDecoration(
              color: const Color(0xFFE6F1FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '하루 5천보 걷고 인증하기(어뷰징 노노)',
                    style: AppTypography.body16EB
                        .copyWith(color: AppColors.gray900),
                  ),
                ),
                SizedBox(
                  width: 32,
                  height: 32,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: onRemove,
                    icon: const Icon(Icons.close,
                        size: 24, color: AppColors.gray700),
                    tooltip: '삭제',
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

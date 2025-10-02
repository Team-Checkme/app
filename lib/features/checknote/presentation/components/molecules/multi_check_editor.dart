import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_typography.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/design_system/widgets/app_button.dart';

/// Step3 멀티 체크 전용 에디터 (Molecule)
class MultiCheckEditor extends StatelessWidget {
  const MultiCheckEditor({
    super.key,
    required this.checks,
    required this.onAdd,
    required this.onRemove,
  });

  final List<String> checks;
  final VoidCallback onAdd;
  final void Function(int index) onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('체크 추가',
            style: AppTypography.body16EB.copyWith(color: AppColors.gray900)),
        const SizedBox(height: AppSpacing.s8),
        Text(
          '여러 개의 체크를 추가할 수 있습니다. 최대 10개까지 권장합니다.',
          style: AppTypography.body14M.copyWith(color: AppColors.gray800),
        ),
        const SizedBox(height: AppSpacing.s16),
        for (int i = 0; i < checks.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.s8),
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.s16),
              decoration: BoxDecoration(
                color: AppColors.getCheckColorByIndex(i),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      checks[i],
                      style: AppTypography.body16EB
                          .copyWith(color: AppColors.gray900),
                    ),
                  ),
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => onRemove(i),
                      icon: const Icon(Icons.close,
                          size: 24, color: AppColors.gray700),
                      tooltip: '삭제',
                    ),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: AppSpacing.s12),
        AppButton(
          type: ButtonType.text,
          text: '체크 추가하기',
          icon: const Icon(Icons.add, size: 16, color: AppColors.gray700),
          onPressed: onAdd,
          height: 48,
          width: double.infinity,
        ),
      ],
    );
  }
}
